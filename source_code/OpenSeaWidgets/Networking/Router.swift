//
//  Router.swift
//  RickMorty
//
//  Created by Oleksii Skliarenko on 06.07.2021.
//

import Foundation

class Router<Endpoint: EndpointProtocol>: RouterProtocol {
  private var task: URLSessionDataTaskProtocol?
  private let session: URLSessionProtocol
  
  required init(session: URLSessionProtocol) {
    self.session = session
  }
  
  func request<T: Decodable>(_ route: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void) {
    do {
      let request = try buildRequest(from: route)
      
      task = session.dataTask(with: request, completionHandler: { (data, response, error) in
        
        if let error = error {
          completion(.failure(.noConnection(error.localizedDescription)))
          return
        }
        
        guard let data = data else {
          completion(.failure(.unknown("Empty response data")))
          return
        }
        
        guard let response = response as? HTTPURLResponse else {
          completion(.failure(.unknown("Empty response HTTPURLResponse")))
          return
        }
        
        // Validate status code
        guard 200..<300 ~= response.statusCode else {
          let responseObject = try? JSONDecoder().decode(NetworkResponseError.self, from: data)
          var errorCode = ServerErrorCode.unknown
          if let recievedSeverCode = ServerErrorCode(rawValue: response.statusCode) {
            errorCode = recievedSeverCode
          }
          completion(.failure(.serverError(message: responseObject?.data?.error ?? "", code: errorCode)))
          return
        }
        
        do {
          let result = try JSONDecoder().decode(T.self, from: data)
          completion(.success(result))
        } catch {
          completion(.failure(.jsonDecodeError(message: error.localizedDescription)))
        }
      })
    } catch {
      completion(.failure(.unknown(error.localizedDescription)))
    }
    
    self.task?.resume()
  }
  
  func cancel() {
    self.task?.cancel()
  }
  
  
  // MARK: - Private methods
  private func buildRequest(from route: Endpoint) throws -> URLRequest {
    var urlComponents = URLComponents()
    urlComponents.scheme = route.scheme
    urlComponents.host = route.host
    urlComponents.path = "/\(Configs.API.apiPath)/\(route.apiVersion.rawValue)/\(route.path ?? "")"
    
    guard let url = urlComponents.url else {
      throw NetworkError.urlEncodeError
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = route.method.rawValue
    
    switch route.task {
    case .request:
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    case .requestWithParams(let params):
      encodeParamsForRequest(params: params, request: &request)
    case .requestWithParamsAndHeaders(let params, let headers):
      encodeParamsForRequest(params: params, request: &request)
      addHeadersForRequest(headers: headers, request: &request)
    case .none:
      break
    }
    return request
  }
  
  private func encodeParamsForRequest(params: [String: Any]?, request: inout URLRequest) {
    guard let params = params else { return }
    switch request.httpMethod {
    case HTTPMethod.get.rawValue:
      request.urlEncodeParameters(parameters: params)
    default:
      request.jsonEncodeParams(parameters: params)
    }
  }
  
  private func addHeadersForRequest(headers: [String: String?]?, request: inout URLRequest) {
    guard let headers = headers else { return }
    headers.forEach { (header, value) in
      request.addValue(value ?? "", forHTTPHeaderField: header)
    }
  }
}

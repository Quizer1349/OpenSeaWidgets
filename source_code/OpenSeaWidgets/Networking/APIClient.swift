//
//  APIClient.swift
//  OpenSeaWidgets
//
//  Created by Oleksii Skliarenko on 06.07.2021.
//

import Foundation


// TODO: Add envirement variables, reachability
final class APIClient {
  
    public static var shared: APIClient = APIClient()
    public var urlSession: URLSessionProtocol = URLSession(configuration: .default)

    fileprivate init() {}
  
    func router<T: EndpointProtocol>(_ api: T.Type) -> Router<T> {
        return Router<T>(session: urlSession)
    }
}

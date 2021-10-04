//
//  CharactersEndpoint.swift
//  RickMorty
//
//  Created by Oleksii Skliarenko on 06.07.2021.
//

import Foundation

enum AssetsAPI {
  case assets(page: Int?)
}

extension AssetsAPI: EndpointProtocol {
  
  var scheme: String! {
    return "https"
  }
  
  var host: String! {
    return Configs.API.baseURL
  }
  
  var apiVersion: APIVersion! {
    return .v1
  }
  
  var path: String! {
    switch self {
    case .assets:
      return "assets"
    }
  }
  
  var method: HTTPMethod! {
    return .get
  }
  
  var task: HTTPTask! {
    switch self {
    case .assets(let page):
      return .requestWithParams(params: [:])
    }
  }
  
  var headers: [String : String?]? {
    return nil
  }
}

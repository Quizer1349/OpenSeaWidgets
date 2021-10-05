//
//  RouterMock.swift
//  OpenSeaWidgetsTests
//
//  Created by Oleksii Skliarenko on 06.07.2021.
//

import XCTest

@testable import OpenSeaWidgets

enum RouterMock {
  case get
  case getWithParams(params: [String: Any]?)
}

extension RouterMock: EndpointProtocol {
    var scheme: String! {
        return "https"
    }
    
    var host: String! {
        return "rickandmortyapi.com"
    }
    
    var path: String! {
        return "/api/path"
    }
  
    var method: HTTPMethod! {
        .get
    }
  
    var task: HTTPTask! {
        switch self {
        case .get:
            return .request
        case .getWithParams(let params):
            return .requestWithParams(params: params)
        }
    }
  
    var headers: [String : String?]? {
        return nil
    }
  
    var urlForCheck: URL! {
        return URL(string: "https://rickandmortyapi.com/api/path")
    }
}

//
//  NetworkResponse.swift
//  RickMorty
//
//  Created by Oleksii Skliarenko on 02.07.2021.
//

import Foundation

protocol NetworkResponse where Self: Codable {
    associatedtype T
    var data: T? { get }
}

struct ApiErrorMessage: Codable {
    let error: String
}

struct NetworkResponseError: NetworkResponse {
    typealias T = ApiErrorMessage
    let data: ApiErrorMessage?
    
    enum CodingKeys: String, CodingKey {
        case data = "error"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(T?.self, forKey: .data)
    }
    
}

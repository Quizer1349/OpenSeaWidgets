//
//  RouterProtocol.swift
//  RickMorty
//
//  Created by Oleksii Skliarenko on 06.07.2021.
//

import Foundation

protocol RouterProtocol {
    associatedtype Endpoint: EndpointProtocol
    func request<T: Codable>(_ route: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void)
    func cancel()
}

//
//  EndpointProtocol.swift
//  OpenSeaWidgets
//
//  Created by Oleksii Skliarenko on 06.07.2021.
//

import Foundation

protocol EndpointProtocol {
    var scheme: String! { get }
    var host: String! { get }
    var apiVersion: APIVersion! { get }
    var path: String! { get }
    var method: HTTPMethod! { get }
    var task: HTTPTask! { get }
    var headers: [String: String?]? { get }
}

//
//  HTTPTask.swift
//  OpenSeaWidgets
//
//  Created by Oleksii Skliarenko on 06.07.2021.
//

import Foundation

enum HTTPTask {
    case request
    case requestWithParams(params: [String: Any]?)
    case requestWithParamsAndHeaders(params: [String: Any]?, headers: [String: String?]?)
}

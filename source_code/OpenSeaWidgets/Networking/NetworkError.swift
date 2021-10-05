//
//  NetworkError.swift
//  OpenSeaWidgets
//
//  Created by Oleksii Skliarenko on 06.07.2021.
//

import Foundation

public enum ServerErrorCode: Int {
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed = 405
    case notAcceptable = 406
    case gone = 410
    case teapot = 418
    case tooManyRequests = 429
    case internalServerError = 500
    case serviceUnavailable = 503
    case unknown
}

public enum NetworkError: Error {
    case serverError(message: String, code: ServerErrorCode)
    case urlEncodeError
    case jsonDecodeError(message: String)
    case noConnection(_ message: String? = nil)
    case unknown(_ message: String? = nil)
}


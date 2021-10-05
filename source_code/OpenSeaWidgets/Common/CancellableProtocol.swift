//
//  CancellableProtocol.swift
//  OpenSeaWidgets
//
//  Created by Oleksii Skliarenko on 03.07.2021.
//

import Foundation

public protocol Cancellable {
  func cancel()
}

extension URLSessionTask: Cancellable {}

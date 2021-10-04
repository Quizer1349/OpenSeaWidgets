//
//  NSObject+ClassNameToString.swift
//  RickMorty
//
//  Created by Oleksii Skliarenko on 02.07.2021.
//

import Foundation

public extension NSObject {
  class var classNameToString: String {
    return String(describing: self)
  }

  var classNameToString: String {
    return String(describing: type(of: self))
  }
}

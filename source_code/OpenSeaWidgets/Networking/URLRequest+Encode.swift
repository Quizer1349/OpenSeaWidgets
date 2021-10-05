//
//  URLRequest+Encode.swift
//  OpenSeaWidgets
//
//  Created by Oleksii Skliarenko on 30.06.2021.
//

import Foundation

extension URLRequest {
    mutating func urlEncodeParameters(parameters: [String : Any]) {
        guard let url = self.url else { return }
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            var queryParams = [URLQueryItem]()
            for (key, value) in parameters {
                let formattedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
                queryParams.append(URLQueryItem(name: key, value: formattedValue))
            }
          if !queryParams.isEmpty {
            urlComponents.queryItems = queryParams
            self.url = urlComponents.url
          }
        }
    }
    
    mutating func jsonEncodeParams(parameters: [String : Any]) {
        self.setValue("application/json", forHTTPHeaderField: "Content-Type")
        httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
    }
}

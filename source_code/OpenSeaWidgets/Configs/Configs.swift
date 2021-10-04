//
//  Configs.swift
//  RickMorty
//
//  Created by Oleksii Skliarenko on 30.06.2021.
//

import UIKit

struct Configs {
    struct API {
        static let baseURL = "api.opensea.io"
        static let apiPath = "api"
    }
    
    struct Colors {
        static let blue = UIColor(red: 0.30, green: 0.43, blue: 0.65, alpha: 1.00)
        static let pink = UIColor(red: 0.68, green: 0.55, blue: 0.62, alpha: 1.00)
        static let white = UIColor(red: 0.90, green: 0.83, blue: 0.81, alpha: 1.00)
    }
    
    struct Layouts {
        static let charsListCellHeight: CGFloat = 160.0
        static let charsListCellPadding: CGFloat = 16.0
    }
}

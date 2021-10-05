//
//  Configs.swift
//  OpenSeaWidgets
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
        static let white = UIColor(red: 1, green: 1, blue: 1, alpha: 1.00)
    }
    
    struct Layouts {
        static let charsListCellHeight: CGFloat = 360.0
        static let charsListCellPadding: CGFloat = 16.0
    }
}

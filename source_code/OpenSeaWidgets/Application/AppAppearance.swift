//
//  AppAppearance.swift
//  OpenSeaWidgets
//
//  Created by Oleksii Skliarenko on 05.07.2021.
//

import UIKit

struct AppAppearance {
    
    static func setup() {
        Self.setupNavBar()
    }
    
    private static func setupNavBar() {
        let appearance = UINavigationBarAppearance()
        let titleAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        appearance.titleTextAttributes = titleAttributes
        appearance.largeTitleTextAttributes = titleAttributes
        
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().tintColor = Configs.Colors.blue
    }
}

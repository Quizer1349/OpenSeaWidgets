//
//  AppAppearance.swift
//  RickMorty
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
        let titleAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = titleAttributes
        appearance.largeTitleTextAttributes = titleAttributes
        appearance.backgroundColor = Configs.Colors.pink
        
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().tintColor = Configs.Colors.blue
    }
}

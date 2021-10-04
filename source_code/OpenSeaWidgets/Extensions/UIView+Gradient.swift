//
//  UIView+Gradient.swift
//  RickMorty
//
//  Created by Oleksii Skliarenko on 03.07.2021.
//

import UIKit

extension UIView {
    func setGradientBackground(topColor: UIColor, bottomColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
                
        layer.insertSublayer(gradientLayer, at:0)
    }
}

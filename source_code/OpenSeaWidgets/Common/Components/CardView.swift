//
//  CardView.swift
//  RickMorty
//
//  Created by Oleksii Skliarenko on 03.07.2021.
//

import UIKit

class CardView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()   
    }
    
    private func setupUI() {
        backgroundColor = Configs.Colors.white
        layer.cornerRadius = 8.0
        layer.shadowColor = Configs.Colors.blue.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 8)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 8
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}

//
//  AvatarView.swift
//  RickMorty
//
//  Created by Oleksii Skliarenko on 04.07.2021.
//

import UIKit

class AvatarView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .lightGray
        layer.cornerRadius = bounds.width / 2
        layer.borderWidth = 4
        layer.borderColor = UIColor.white.cgColor
        layer.masksToBounds = true
    }
}

//
//  UIImage+Color.swift
//  OpenSeaWidgets
//
//  Created by Oleksii Skliarenko on 03.07.2021.
//

import UIKit

public extension UIImage {
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        color.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))

        guard let aCgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            self.init()
            return
        }

        UIGraphicsEndImageContext()
        self.init(cgImage: aCgImage)
    }
}

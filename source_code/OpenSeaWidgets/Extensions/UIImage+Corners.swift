//
//  UIImage+Corners.swift
//  RickMorty
//
//  Created by Oleksii Skliarenko on 03.07.2021.
//

import UIKit

public extension UIImage {
    func roundedCorners(radius: CGFloat = 3,
                        byRoundingCorners corners: UIRectCorner = .allCorners) -> UIImage? {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)

        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        guard let contentRef: CGContext = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        contentRef.addPath(UIBezierPath(roundedRect: rect,
                                        byRoundingCorners: UIRectCorner.allCorners,
                                        cornerRadii: CGSize(width: radius, height: radius)).cgPath)
        contentRef.clip()
        draw(in: rect)
        contentRef.drawPath(using: .fillStroke)
        guard let output = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        UIGraphicsEndImageContext()
        return output
    }

    func circleImage() -> UIImage? {
        let width = self.size.width < self.size.height ? self.size.width : self.size.height
        return roundedCorners(radius: width / 2, byRoundingCorners: .allCorners)
    }
}

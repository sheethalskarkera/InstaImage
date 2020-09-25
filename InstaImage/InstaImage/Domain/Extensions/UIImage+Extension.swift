//
//  UIImage+Extension.swift
//  InstaImage
//
//  Created by Sheethal on 25/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import UIKit

extension UIImage {
    func scaled(toSize newSize: CGSize, in rect: CGRect) -> UIImage {
        UIGraphicsBeginImageContext(newSize)

        draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage ?? UIImage()
    }
    
    func scale() -> UIImage {
        let smallerSize = CGSize(width: 200, height: 200)
        let newImage = self.scaled(
            toSize: smallerSize,
            in: CGRect(x: 0, y: 0, width: smallerSize.width, height: smallerSize.height)
        )
        return newImage
    }
}

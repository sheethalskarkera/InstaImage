//
//  UIImageView+Extension.swift
//  InstaImage
//
//  Created by Sheethal on 24/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
    func load(url: URL) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
            self.image = cachedImage
        } else {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            imageCache.setObject(image, forKey: url.absoluteString as NSString)
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
}

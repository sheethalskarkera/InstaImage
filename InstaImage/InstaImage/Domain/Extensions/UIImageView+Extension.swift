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
    func load(url: URL, completion: @escaping () -> Void) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
            self.image = cachedImage
            completion()
        } else {
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                guard let self = self else { return }
                if let data = data,
                    let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageCache.setObject(image.scale(), forKey: url.absoluteString as NSString)
                        self.image = self.image?.scale()
                        completion()
                    }
                } else {
                    completion()
                }
            }
            task.resume()
        }
    }
}



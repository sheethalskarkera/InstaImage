//
//  CanineDetailTableViewCell.swift
//  InstaImage
//
//  Created by Sheethal on 24/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import UIKit

class CanineDetailTableViewCell: UITableViewCell {

    @IBOutlet private(set) var nameLabel: UILabel!
    @IBOutlet private(set) var lifeSpanLabel: UILabel!
    @IBOutlet private(set) var canineImagevView: UIImageView!
    
    func bind(_ cellModel: CanineInformationCellViewModel) {
        nameLabel.text = cellModel.name
        lifeSpanLabel.text = cellModel.lifeSpan
        if let url = cellModel.imageURL {
//            load(url: url) { (image) in
//                DispatchQueue.main.async {
//                self.imageView?.image = image
//                self.setNeedsLayout()
//                }
//            }
            imageView?.load(url: url) {
                self.setNeedsLayout()
            }
            
        }
    }

}

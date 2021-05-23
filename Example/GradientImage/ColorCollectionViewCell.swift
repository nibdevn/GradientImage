//
//  ColorCollectionViewCell.swift
//  GradientImage_Example
//
//  Created by MacBook-Na on 2020/11/22.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import GradientImage

class ColorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var colorImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        colorImageView.layer.cornerRadius = 5
    }
    
    func configurate(_ gradient: Gradient) {
        colorImageView.image = gradient.image
    }
}

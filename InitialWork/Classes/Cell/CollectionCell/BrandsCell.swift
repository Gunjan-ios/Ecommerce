//
//  BrandsCell.swift
//  InitialWork
//
//  Created by Gunjan on 17/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class BrandsCell: UICollectionViewCell {
    
    @IBOutlet weak var img_brands: UIImageView!

    override func awakeFromNib() {
        //        layer.cornerRadius = 8.0
        //        layer.borderColor = UIColor.gray.cgColor
        //        layer.borderWidth = 0.5
        
        layer.cornerRadius = layer.bounds.width/2
        layer.borderColor = UIColor.clear.cgColor
        layer.masksToBounds = true
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: -1.0, height: 1.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.4
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect:bounds, cornerRadius:layer.cornerRadius).cgPath
        
    }
}

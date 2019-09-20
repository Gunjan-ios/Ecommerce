//
//  HomeCell.swift
//  InitialWork
//
//  Created by Gunjan on 09/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var img_banner: UIImageView!
    
    override func awakeFromNib() {
        layer.cornerRadius = 15.0
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
     
        
//        layer.cornerRadius = 15.0
//        layer.borderColor = UIColor.clear.cgColor
//        layer.masksToBounds = true
//        layer.shadowColor = UIColor.gray.cgColor
//        layer.shadowOffset = CGSize(width: -1.0, height: 1.0)
//        layer.shadowRadius = 2.0
//        layer.shadowOpacity = 0.7
//        layer.masksToBounds = false
//        layer.shadowPath = UIBezierPath(roundedRect:bounds, cornerRadius:layer.cornerRadius).cgPath
        
        
    }
    
}

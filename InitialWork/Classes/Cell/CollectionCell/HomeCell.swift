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
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 2
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 3
    }
    
}

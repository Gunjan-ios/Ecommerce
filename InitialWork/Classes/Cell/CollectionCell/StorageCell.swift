//
//  StorageCell.swift
//  InitialWork
//
//  Created by Gunjan on 01/10/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class StorageCell: UICollectionViewCell {
    @IBOutlet weak var filterName: UILabel!
    
    static let  DummyStorage = ["16 GB","32 GB","64 GB","128 GB","256 GB"]
        
    override func awakeFromNib() {
        layer.cornerRadius = 6
        layer.borderWidth = 0.1
        layer.masksToBounds = true
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.4
        layer.masksToBounds = false
        
    }
}

//
//  CategoryCell.swift
//  InitialWork
//
//  Created by Gunjan on 12/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var img_Category: UIImageView!
    @IBOutlet weak var name : mediumLabel!

    override func awakeFromNib() {
        layer.cornerRadius = 8.0
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 0.5

    }
}
struct Category {
    let imageName: String!
    let name: String!
}

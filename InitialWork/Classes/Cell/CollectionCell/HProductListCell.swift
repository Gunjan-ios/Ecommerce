//
//  HProductListCell.swift
//  InitialWork
//
//  Created by Gunjan on 11/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import AARatingBar

class HProductListCell: UICollectionViewCell {
    
    @IBOutlet weak var img_product: UIImageView!
    @IBOutlet weak var name: mediumLabel!
    @IBOutlet weak var Actul_price: BoldLabel!
    @IBOutlet weak var old_price: mediumLabel!
    @IBOutlet weak var product_rating: AARatingBar!
    @IBOutlet weak var btn_cart: AddTOCartButton!
    
    @IBOutlet weak var btn_compare: AddTOCartButton!
    @IBOutlet weak var btn_fav: AddTOCartButton!
    
    
    override func awakeFromNib() {
        layer.cornerRadius = 8.0
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 2
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 3
//        someLabel.attributedText = someText.strikeThrough()
    }
}


struct Product {
    let imageName: String!
    let name: String!
    let actulPrice: String!
    let oldPrice: String!
    let productRating: CGFloat!
    let cartData : String!
}

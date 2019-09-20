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
    @IBOutlet weak var DetailsView: UIView!
    
    
    override func awakeFromNib() {
        layer.cornerRadius = 6
        layer.borderWidth = 0.1
//        layer.borderColor =  UIColor.gray.cgColor
//        layer.borderColor = UIColor.clear.cgColor
        layer.masksToBounds = true
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.4
        layer.masksToBounds = false
//        layer.shadowPath = UIBezierPath(roundedRect:bounds, cornerRadius:layer.cornerRadius).cgPath
        DetailsView.layer.cornerRadius = layer.cornerRadius

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
class ListProduct{
    
    func DataLoad() -> [Product] {
        let Products = [
            Product.init (imageName: "cate_fashion_men", name: "Apple Macbook", actulPrice: "$100", oldPrice: "$110", productRating: 3, cartData: ""),
            Product.init (imageName: "cate_fashion_women", name: "Apple Airbook", actulPrice: "$200", oldPrice: "$220", productRating: 4, cartData: ""),
            Product.init (imageName: "cate_fashion_men", name: "Apple Macbook", actulPrice: "$100", oldPrice: "$110", productRating: 3, cartData: ""),
            Product.init (imageName: "cate_fashion_men", name: "Apple Macbook", actulPrice: "$100", oldPrice: "$110", productRating: 3, cartData: ""),
            Product.init (imageName: "cate_fashion_men", name: "Apple Macbook", actulPrice: "$100", oldPrice: "$110", productRating: 3, cartData: ""),
        ]
        return Products
        
    }
}

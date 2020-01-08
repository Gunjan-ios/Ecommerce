//
//  HProductListCell.swift
//  InitialWork
//
//  Created by Gunjan on 11/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import Cosmos

class HProductListCell: UICollectionViewCell {
    
    @IBOutlet weak var img_product: UIImageView!
    @IBOutlet weak var name: mediumLabel!
    @IBOutlet weak var Actul_price: BoldLabel!
    @IBOutlet weak var old_price: mediumLabel!
    @IBOutlet weak var product_rating: CosmosView!
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
        layer.shadowOffset = .zero
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
    let productRating: Double!
    let cartData : String!
  
}
class ListProduct{
    
    func DataLoad() -> [Product] {
        let Products = [
            Product.init (imageName: "p1", name: "Apple iPhone XR", actulPrice: "$850", oldPrice: "$1150", productRating: 4.0, cartData: ""),
            Product.init (imageName: "tshirt", name: "Men Polo Neck Multicolor T-Shirt", actulPrice: "$80", oldPrice: "$100", productRating: 4.0, cartData: ""),
            Product.init (imageName: "kurti", name: "Choli and Dupatta Set", actulPrice: "$220", oldPrice: "$245", productRating: 3.0, cartData: ""),
            Product.init (imageName: "watch", name: "Brown Dial Analog Watch", actulPrice: "$100", oldPrice: "$110", productRating: 3.0, cartData: ""),
            Product.init (imageName: "macbook", name: "Apple MacBook Air", actulPrice: "$2200", oldPrice: "$2500", productRating: 4.0, cartData: ""),
        ]
        return Products
        
    }
}

//
//  ListTableCell.swift
//  InitialWork
//
//  Created by Gunjan on 16/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import Cosmos

class ListTableCell: UITableViewCell {
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
        super.awakeFromNib()
        // Initialization code
        DetailsView.layer.cornerRadius = 6
//        DetailsView.layer.borderWidth = 0.1
        DetailsView.layer.masksToBounds = true
        DetailsView.layer.shadowColor = UIColor.gray.cgColor
        DetailsView.layer.shadowOffset = .zero
        DetailsView.layer.shadowRadius = 3.0
        DetailsView.layer.shadowOpacity = 0.4
        DetailsView.layer.masksToBounds = false

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class CartListProduct{
    
    func DataLoad() -> [Product] {
        let Products = [
            Product.init (imageName: "p1", name: "Apple iPhone XR", actulPrice: "$850", oldPrice: "$1150", productRating: 4.0, cartData: ""),
            Product.init (imageName: "tshirt", name: "Men Polo Neck Multicolor T-Shirt", actulPrice: "$80", oldPrice: "$100", productRating: 4.0, cartData: ""),
        ]
        return Products
        
    }
}

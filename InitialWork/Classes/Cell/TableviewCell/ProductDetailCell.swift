//
//  ProductDetailCell.swift
//  InitialWork
//
//  Created by Gunjan on 25/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
protocol ReviewDelegate {
    func ReviewProceed(isForReturnView : Bool,mesage : String)
}
class ProductDetailCell: UITableViewCell {
    var delegate : ReviewDelegate!
    @IBOutlet weak var name: mediumLabel!
    @IBOutlet weak var price: BoldLabel!
    @IBOutlet weak var Quntity: mediumLabel!
    @IBOutlet weak var img_product: UIImageView!
    @IBOutlet weak var Return: UIButton!
    @IBOutlet weak var Review: UIButton!
    @IBOutlet weak var detailView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        detailView.layer.cornerRadius = 4
        //        detailView.layer.borderWidth = 0.5
        //        detailView.layer.borderColor = UIColor.lightGray.cgColor
        detailView.layer.masksToBounds = true
        detailView.layer.shadowColor = UIColor.gray.cgColor
        detailView.layer.shadowOffset = .zero
        detailView.layer.shadowRadius = 3.0
        detailView.layer.shadowOpacity = 0.4
        detailView.layer.masksToBounds = false
        
        Return.layer.cornerRadius = 4
        Review.layer.cornerRadius = 4
    }

    @IBAction func onReviewPressed(_ sender: UIButton) {

        if sender == Return{
            delegate.ReviewProceed(isForReturnView: true, mesage: "Return Item")
        }else{
            delegate.ReviewProceed(isForReturnView: false, mesage: "Item Review")
        }
        
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
struct OrderProduct {
    let name: String!
    let image_Product: UIImage!
    let Price: String!
    let Quantity: String!
}
class ProductOrder{
    
    func ProductListing() -> [OrderProduct] {
        let listorder = [
            OrderProduct (name: "Apple Macbook Air" , image_Product: #imageLiteral(resourceName: "P4"), Price: "$1100", Quantity: "Quantity : 1"),
            OrderProduct (name: "Apple iPhone XR" , image_Product: #imageLiteral(resourceName: "p2"), Price: "$850", Quantity: "Quantity : 3"),
            OrderProduct (name: "Brown Dial Analog Watch" , image_Product: #imageLiteral(resourceName: "watch"), Price: "$100", Quantity: "Quantity : 2"),]
        
        return listorder
    }
    
}

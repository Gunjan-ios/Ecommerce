//
//  MyOrderCell.swift
//  InitialWork
//
//  Created by Gunjan on 24/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class MyOrderCell: UITableViewCell {

    @IBOutlet weak var Order: UILabel!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var name: mediumLabel!
    @IBOutlet weak var price: BoldLabel!
    @IBOutlet weak var paymentType: mediumLabel!
    @IBOutlet weak var Approxtime: mediumLabel!
    @IBOutlet weak var orderStatus: mediumLabel!
    
    @IBOutlet weak var img_product: UIImageView!
    @IBOutlet weak var cancleOrder: UIButton!
    @IBOutlet weak var repeatOrder: UIButton!
    @IBOutlet weak var trackOrder: UIButton!
    
    @IBOutlet weak var detailView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        detailView.layer.cornerRadius = 4
//        detailView.layer.borderWidth = 1
//        detailView.layer.borderColor = UIColor.darkGray.cgColor
        detailView.layer.masksToBounds = true
        detailView.layer.shadowColor = UIColor.black.cgColor
        detailView.layer.shadowOffset = .zero
        detailView.layer.shadowRadius = 2.0
        detailView.layer.shadowOpacity = 0.4
        detailView.layer.masksToBounds = false
        
        cancleOrder.layer.cornerRadius = 4
        repeatOrder.layer.cornerRadius = 4
        trackOrder.layer.cornerRadius = 4
        
//        cancleOrder.layer.borderWidth =  0.3
//        repeatOrder.layer.borderWidth =  0.3
//        trackOrder.layer.borderWidth =  0.3
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
struct MyOrder {
    let name: String!
    let image_payment: UIImage!
    let Selectedpayment: String!
    let Order: String!
    let Date: String!
    let Price: String!
    let Time: String!
    let PaymentStatus: Int!

}
class OrderData{
    
    func OrderListing() -> [MyOrder] {
        let listorder = [
            MyOrder (name: "Apple Macbook Air", image_payment: #imageLiteral(resourceName: "P4"), Selectedpayment: "Cash on Delivery", Order: "#791235565254566A2", Date: "24 April 2019", Price: "$1100", Time: "", PaymentStatus: 3),
            MyOrder(name: "Men Polo Neck Multicolor T-Shirt", image_payment: #imageLiteral(resourceName: "tshirt"), Selectedpayment: "Patym", Order: "#451235563454666A2", Date: "2 April 2019", Price: "$80", Time: "", PaymentStatus: 1),
            MyOrder(name: "Choli and Dupatta Set", image_payment: #imageLiteral(resourceName: "kurti"), Selectedpayment: "Cash on Delivery", Order: "#901235563254566A2", Date: "3 June 2019", Price: "$220", Time: "", PaymentStatus: 2),
            MyOrder(name: "Brown Dial Analog Watch", image_payment: #imageLiteral(resourceName: "watch"), Selectedpayment: "Cash on Delivery", Order: "#60129685254566A2", Date: "15 May 2019", Price: "$100", Time: "Approx Delivery Time : 3 Days from today", PaymentStatus: 0),]
        
        return listorder
    }
    
}



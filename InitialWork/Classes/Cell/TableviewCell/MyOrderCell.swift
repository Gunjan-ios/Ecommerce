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
    
    @IBOutlet weak var cancleOrder: UIButton!
    @IBOutlet weak var repeatOrder: UIButton!
    @IBOutlet weak var trackOrder: UIButton!
    
    @IBOutlet weak var detailView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Initialization code
        detailView.layer.cornerRadius = 4
//        detailView.layer.borderWidth = 0.5
//        detailView.layer.borderColor = UIColor.lightGray.cgColor
        detailView.layer.masksToBounds = true
        detailView.layer.shadowColor = UIColor.gray.cgColor
        detailView.layer.shadowOffset = CGSize(width: -1, height: 1)
        detailView.layer.shadowRadius = 3.0
        detailView.layer.shadowOpacity = 0.4
        detailView.layer.masksToBounds = false
        
        cancleOrder.layer.cornerRadius = 4
        repeatOrder.layer.cornerRadius = 4
        trackOrder.layer.cornerRadius = 4
        
        
        
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
            MyOrder (name: "Apple Macbook Pro 12 with touch bar", image_payment: #imageLiteral(resourceName: "iconHomeSelected"), Selectedpayment: "Cash on Delivery", Order: "#791235565254566A2", Date: "24 April 2019", Price: "$100", Time: "Approx Delivery Time : 3 Days from today", PaymentStatus: 0),
            MyOrder(name: "Apple Macbook Pro 12 with touch bar", image_payment: #imageLiteral(resourceName: "iconProfileSelected"), Selectedpayment: "Patym", Order: "#791235565254566A2", Date: "24 April 2019", Price: "$100", Time: "", PaymentStatus: 1),
            MyOrder(name: "Apple Macbook Pro 12 with touch bar", image_payment: #imageLiteral(resourceName: "iconFavoriteSelected"), Selectedpayment: "Cash on Delivery", Order: "#791235565254566A2", Date: "24 April 2019", Price: "$100", Time: "", PaymentStatus: 2),
            MyOrder(name: "Apple Macbook Pro 12 with touch bar", image_payment: #imageLiteral(resourceName: "iconVideoSelected"), Selectedpayment: "Cash on Delivery", Order: "#791235565254566A2", Date: "24 April 2019", Price: "$100", Time: "", PaymentStatus: 3),
            MyOrder(name: "Apple Macbook Pro 12 with touch bar", image_payment: #imageLiteral(resourceName: "iconVideoSelected"), Selectedpayment: "Cash on Delivery", Order: "#791235565254566A2", Date: "24 April 2019", Price: "$100", Time: "", PaymentStatus: 0),
        MyOrder(name: "Apple Macbook Pro 12 with touch bar", image_payment: #imageLiteral(resourceName: "iconVideoSelected"), Selectedpayment: "Patym", Order: "#791235565254566A2", Date: "24 April 2019", Price: "$100", Time: "", PaymentStatus: 1),
        MyOrder(name: "Apple Macbook Pro 12 with touch bar", image_payment: #imageLiteral(resourceName: "iconVideoSelected"), Selectedpayment: "Cash on Delivery", Order: "#791235565254566A2", Date: "24 April 2019", Price: "$100", Time: "", PaymentStatus: 2),]
        
        return listorder
    }
    
}

//
//  PaymentTypeCell.swift
//  InitialWork
//
//  Created by Gunjan on 20/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class PaymentTypeCell: UITableViewCell {
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img_Payment: UIImageView!
    @IBOutlet weak var SelectedPayment: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        detailView.layer.cornerRadius = 2
                detailView.layer.borderWidth = 0.5
                detailView.layer.borderColor = UIColor.lightGray.cgColor
//        detailView.layer.masksToBounds = true
//        detailView.layer.shadowColor = UIColor.gray.cgColor
//        detailView.layer.shadowOffset = CGSize(width: -1, height: 1)
//        detailView.layer.shadowRadius = 3.0
//        detailView.layer.shadowOpacity = 0.4
//        detailView.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
struct PaymentType {
    let name: String!
    let image_payment: UIImage!
   let Selectedpayment: Bool
}
class Payment{
    func DataLoad() -> [PaymentType] {
        let Payment = [
           PaymentType.init(name: "Credit / Debit Card", image_payment: #imageLiteral(resourceName: "payment_credit_card"),Selectedpayment:false),
           PaymentType.init(name: "Paytm", image_payment: #imageLiteral(resourceName: "payment_paytm"),Selectedpayment:false),
            PaymentType.init(name: "Cash On Delivery", image_payment: #imageLiteral(resourceName: "payment_cod.jpg"),Selectedpayment:true)]
                return Payment
    }
}

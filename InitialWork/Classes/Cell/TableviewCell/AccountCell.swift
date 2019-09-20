//
//  AccountCell.swift
//  InitialWork
//
//  Created by Gunjan on 20/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class AccountCell: UITableViewCell {

    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img_Payment: UIImageView!

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
struct AccountType {
    let name: String!
    let image_payment: UIImage!
    let Selectedpayment: Bool
}
class Account{
    func FristSectionDataLoad() -> [AccountType] {
        let Account = [
            AccountType.init(name: "My Orders", image_payment: #imageLiteral(resourceName: "account_myorder"),Selectedpayment:false),
            AccountType.init(name: "Offers", image_payment: #imageLiteral(resourceName: "account_offer"),Selectedpayment:false),
            AccountType.init(name: "Notification", image_payment: #imageLiteral(resourceName: "account_notification"),Selectedpayment:false),
          AccountType.init(name: "My Addresses", image_payment: #imageLiteral(resourceName: "account_myaddress"),Selectedpayment:false),]
        return Account
    }
    func SecondSectionDataLoad() -> [AccountType] {
        let Account = [
            AccountType.init(name: "My Wallet", image_payment: #imageLiteral(resourceName: "account_mywallet"),Selectedpayment:false),
            AccountType.init(name: "Settings", image_payment: #imageLiteral(resourceName: "account_settings"),Selectedpayment:false),
            AccountType.init(name: "Feedback", image_payment: #imageLiteral(resourceName: "account_feedback"),Selectedpayment:false),
            AccountType.init(name: "Rate Us", image_payment: #imageLiteral(resourceName: "account_rate"),Selectedpayment:false),
            AccountType.init(name: "Help Center", image_payment: #imageLiteral(resourceName: "account_help"),Selectedpayment:false),
            AccountType.init(name: "Terms & Conditions", image_payment: #imageLiteral(resourceName: "account_term"),Selectedpayment:false),]
        return Account
    }
    func ThirdSectionDataLoad() -> [AccountType] {
        let Account = [
            AccountType.init(name: "Logout", image_payment: #imageLiteral(resourceName: "account_logout"),Selectedpayment:false),
        ]
        return Account
    }
}

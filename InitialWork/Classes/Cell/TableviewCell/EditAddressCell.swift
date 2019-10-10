//
//  EditAddressCell.swift
//  InitialWork
//
//  Created by Gunjan on 20/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class EditAddressCell: UITableViewCell {
    
    @IBOutlet weak var TitleName: BoldLabel!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var Status: UILabel!
    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var img_address: UIButton!
    
    
    static var ALLAddress = [Adresses (name: "Home Address", Adress: "3021 Pooh Bear Lane, 3rd Floor, SELMA, AL, Alabama, 36703", img_address:#imageLiteral(resourceName: "home_delivery"), status: ""), Adresses (name: "Office Address", Adress: "3021 Pooh Bear Lane, 3rd Floor, SELMA, AL, Alabama, 36703", img_address:#imageLiteral(resourceName: "address_office"), status: "Default Address"),Adresses (name: "Other Address", Adress: "3021 Pooh Bear Lane, 3rd Floor, SELMA, AL, Alabama, 36703", img_address:#imageLiteral(resourceName: "address_other"), status: ""),Adresses (name: "Other Address", Adress: "3021 Pooh Bear Lane, 3rd Floor, SELMA, AL, Alabama, 36703", img_address:#imageLiteral(resourceName: "address_other"), status: ""),]
    
    static var NotifiationData = [Adresses (name: "Notification Title", Adress: "Thank you for downloading the application.", img_address:#imageLiteral(resourceName: "home_delivery"), status: ""), Adresses (name: "Notification Title", Adress: "Get 20% off on macbook pro, 3 days validity.", img_address:#imageLiteral(resourceName: "address_office"), status: ""),Adresses (name: "Notification Title", Adress: "Your order #1234567890 has been deliverd.\nThank you \nContinue to shopping with us.", img_address:#imageLiteral(resourceName: "address_other"), status: "")]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        detailView.layer.borderWidth = 0.5
        detailView.layer.cornerRadius = 4
        detailView.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

struct Adresses {
    var name : String!
    var Adress : String!
    var img_address : UIImage!
    var status : String!
}

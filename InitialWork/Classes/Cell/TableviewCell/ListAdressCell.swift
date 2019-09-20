//
//  ListAdressCell.swift
//  InitialWork
//
//  Created by Gunjan on 19/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class ListAdressCell: UITableViewCell {

    @IBOutlet weak var validity: UILabel!
    @IBOutlet weak var nameDelivery: UILabel!
    @IBOutlet weak var charges: UILabel!
    @IBOutlet weak var btn_selction: UIButton!
    @IBOutlet weak var detailView: UIView!
    
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
struct AddressType {
    let validity: String!
    let nameDelivery: String!
    let charges: String!
    let selected: Bool
}
class Address{
    func DataLoad() -> [AddressType] {
           let Address = [
            AddressType.init(validity: "1 day delivery", nameDelivery: "Express Delivery", charges: "$10",selected:true),
             AddressType.init(validity: "Upto 5 bussiness days delivery", nameDelivery: "Standard Delivery", charges: "",selected:false)]
        return Address
    }
}

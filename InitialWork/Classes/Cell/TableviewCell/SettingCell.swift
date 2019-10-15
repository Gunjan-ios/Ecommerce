//
//  SettingCell.swift
//  InitialWork
//
//  Created by Gunjan on 09/10/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell {
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var Name: BoldLabel!
    @IBOutlet weak var Swt_status: UISwitch!
    
    
    static var settingData = [Settings (name: "Order Notification", status: true),Settings (name: "Offer Notification", status: false)]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        detailView.layer.cornerRadius = 6
        //        detailView.layer.borderWidth = 0.5
        //        detailView.layer.borderColor = UIColor.lightGray.cgColor
        detailView.layer.masksToBounds = true
        detailView.layer.shadowColor = UIColor.gray.cgColor
        detailView.layer.shadowOffset = .zero
        detailView.layer.shadowRadius = 3.0
        detailView.layer.shadowOpacity = 0.4
        detailView.layer.masksToBounds = false
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
struct Settings {
    var name : String!
    var status : Bool!
}

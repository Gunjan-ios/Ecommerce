//
//  DescriptionCell.swift
//  InitialWork
//
//  Created by Gunjan on 03/10/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class DescriptionCell: UITableViewCell {

    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var TitleLable: UILabel!
    @IBOutlet weak var DetailLable: UILabel!
    
  static  let specification = [
        Specification.init(TitleLable: "OS", DetailLable: "iOS 12"),
        Specification.init(TitleLable: "RAM", DetailLable: "64 GB"),
        Specification.init(TitleLable: "Weight", DetailLable: "194 g"),
        Specification.init(TitleLable: "Dimensions", DetailLable: "75.7 x 150.9 x 8.3 mm"),
        Specification.init(TitleLable: "Batteries", DetailLable: "1 Lithium ion"),
        Specification.init(TitleLable: "Wireless communication technologies", DetailLable: "Bluetooth;WiFi Hotspot"),
        Specification.init(TitleLable: "Special features", DetailLable: "Dual SIM, GPS, Music Player, Video PlayerVibration motor, Proximity sensor, Ambient light sensor, Accelerometer, Electronic Compass"),
        Specification.init(TitleLable: "Whats in the box", DetailLable: "Handset, Power Adapter, USB Cable, SIM Eject Tool, Warranty Card and User Guide"),
        
        ]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
                borderView.layer.borderWidth = 0.5
                borderView.layer.borderColor = UIColor.darkGray.cgColor
//        borderView.addBorder(toSide: .Bottom, withColor: UIColor.darkGray.cgColor, andThickness:1.0)
//         borderView.addBorder(toSide: .Top, withColor: UIColor.darkGray.cgColor, andThickness:1.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
struct Specification {
    let TitleLable: String!
    let DetailLable: String!
}
//class SpecificationData{
//    func DataLoad() -> [Specification] {
//       
//        return specification
//    }
//}

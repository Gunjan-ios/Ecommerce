//
//  ReviewCell.swift
//  InitialWork
//
//  Created by Gunjan on 04/10/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import Cosmos

class ReviewCell: UITableViewCell {
    
    
    @IBOutlet weak var img_profile: UIImageView!
    @IBOutlet weak var name: BoldLabel!
    @IBOutlet weak var Desc: mediumLabel!
    @IBOutlet weak var Date: mediumLabel!
    @IBOutlet weak var ratingView: CosmosView!
    
    
    static  let Reviews  = [
        Review.init(name: "Sachin Tendulkar", image_Profile: #imageLiteral(resourceName: "placeholder_user"), Rating: 4.0, Description: "Good qualities:Smooth performance, triple card slot, fast face unlock, wireless FM (no headset needed) + FM recording, large battery, great camera (esp. for the segment), matte finish polycarbonate back panel, splash resistant P2i coating.", Date: "24 March 2018"),
          Review.init(name: "Jhon Due", image_Profile: #imageLiteral(resourceName: "placeholder_user"), Rating: 5.0, Description: "Good qualities:Smooth performance, triple card slot, fast face unlock, wireless FM (no headset needed) + FM recording, large battery, great camera (esp. for the segment), matte finish polycarbonate back panel, splash resistant P2i coating.", Date: "24 March 2018"),
        ]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
struct Review {
    let name: String!
    let image_Profile: UIImage!
    let Rating: Double!
    let Description: String!
    let Date: String!    
}

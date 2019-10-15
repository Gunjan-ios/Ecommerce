//
//  OfferCell.swift
//  InitialWork
//
//  Created by Gunjan on 09/10/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class OfferCell: UITableViewCell {

    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var img_offer: UIImageView!
    @IBOutlet weak var detailsView: UIView!
    
    static var OfferData = [Offer (Discount: "Get 20% off on macbook pro, 3 day validity", image_offer: #imageLiteral(resourceName: "banner8")),Offer (Discount: "Get 20% off on macbook pro, 3 day validity", image_offer: #imageLiteral(resourceName: "banner7")),Offer (Discount: "Get 20% off on macbook pro, 3 day validity", image_offer: #imageLiteral(resourceName: "banner11"))]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        layer.cornerRadius = 4
        detailsView.layer.cornerRadius = 4
          img_offer.layer.cornerRadius = 4

//       img_offer.layer.shadowPath = UIBezierPath (roundedRect: bounds, byRoundingCorners:  [.topLeft , .topRight ], cornerRadii: CGSize (width: 4, height: 4)).cgPath

//        img_offer.roundCorners(corners: [.topLeft , .topRight ], radius: 4)
        //        detailView.layer.borderWidth = 0.5
        //        detailView.layer.borderColor = UIColor.lightGray.cgColor
        detailsView.layer.masksToBounds = true
        detailsView.layer.shadowColor = UIColor.gray.cgColor
        detailsView.layer.shadowOffset = .zero
        detailsView.layer.shadowRadius = 3.0
        detailsView.layer.shadowOpacity = 0.4
        detailsView.layer.masksToBounds = false
//        img_offer.layer.masksToBounds = false
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
struct Offer {
    let Discount: String!
    let image_offer: UIImage!
}

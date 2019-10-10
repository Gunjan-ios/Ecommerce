//
//  FirstDetailCell.swift
//  InitialWork
//
//  Created by Gunjan on 01/10/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class FirstDetailCell: UITableViewCell {
    @IBOutlet weak var name: BoldLabel!
    @IBOutlet weak var price: BoldLabel!
    @IBOutlet weak var oldprice: mediumLabel!
    @IBOutlet weak var rating: UIButton!
    @IBOutlet weak var ReturnView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

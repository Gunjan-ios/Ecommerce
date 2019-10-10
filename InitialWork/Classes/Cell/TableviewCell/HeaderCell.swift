//
//  HeaderCell.swift
//  InitialWork
//
//  Created by Gunjan on 04/10/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var img_category: UIImageView!
    @IBOutlet weak var detailsData: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

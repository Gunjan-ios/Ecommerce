//
//  EditAddressCell.swift
//  InitialWork
//
//  Created by Gunjan on 20/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class EditAddressCell: UITableViewCell {
    
    @IBOutlet weak var detailView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        detailView.layer.borderWidth = 0.5
        detailView.layer.cornerRadius = 2

        detailView.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

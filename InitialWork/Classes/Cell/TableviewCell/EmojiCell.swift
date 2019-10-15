//
//  EmojiCell.swift
//  InitialWork
//
//  Created by Gunjan on 14/10/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit


class EmojiCell: UITableViewCell {
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var Name: BoldLabel!

    static var EmojiData = [FeedBackEmoji (name: "Store Ambience/Decor/Layout"),
    FeedBackEmoji (name: "Product Range"),
    FeedBackEmoji (name: "Product Availability"),
    FeedBackEmoji (name: "Staff Attitude"),
    FeedBackEmoji (name: "Product Knowlegde of staff"),]
    
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
struct FeedBackEmoji {
    var name : String!
}

//
//  FilterSliderCell.swift
//  InitialWork
//
//  Created by Gunjan on 26/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit

class FilterSliderCell: UICollectionViewCell {
   
    @IBOutlet weak var slectedFilter: UILabel!
    @IBOutlet weak var filterName: UILabel!
    
  static let  filterItem = ["Category","Brand","Price","Color","Storage","Size","Ram","Primary Camera","Secondary Camera","Rating","Discount"]
   static let  SelectedItem = ["Mobile","All","$5-$500","Red","16 GB","5.5 inch","3 GB","20 MB","48 MB","4","20%"]

    
    override func awakeFromNib() {
        layer.cornerRadius = 6
        layer.borderWidth = 0.1
        layer.masksToBounds = true
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.4
        layer.masksToBounds = false
    
    }
    
    
}

//
//  RoundedView.swift
//  ParklandFuelpricecollector
//
//  Created by Gunjan on 10/10/18.
//  Copyright © 2018 Parkland. All rights reserved.
//

import UIKit

class RoundedView: UIView {

    override func awakeFromNib() {
        layer.cornerRadius = frame.size.height/2
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
    }
    
}
class ThemeColorButton: UIButton {
    
    override func awakeFromNib() {
        layer.cornerRadius = frame.size.height/2
//        layer.borderColor = UIColor.black.cgColor
//        layer.borderWidth = 1
        backgroundColor = YELLOW_COLOR
        titleLabel?.font = UIFont (name: BoldFont, size: 20.0)
        setTitleColor(UIColor.white, for: .normal)
    }
//    == HindVadodara-Medium
//    == HindVadodara-SemiBold

}
class RegularFontButton: UIButton {
    override func awakeFromNib() {
        titleLabel?.font = UIFont (name: RegularFont, size: UIFont.systemFontSize)
    }
}
class RoundedButton: UIButton {
    override func awakeFromNib() {
       layer.cornerRadius = frame.size.height/2
    }
}

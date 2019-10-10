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
        backgroundColor = YELLOW_COLOR
        titleLabel?.font = UIFont (name: BoldFont, size: 20.0)
        setTitleColor(UIColor.white, for: .normal)
    }
}
class BlueThemeButton: UIButton {
    override func awakeFromNib() {
        layer.cornerRadius = frame.size.height/2
        backgroundColor = THEME_COLOR
        titleLabel?.font = UIFont (name: MediumFont, size: 12)
        setTitleColor(UIColor.white, for: .normal)
    }
}
class AddTOCartButton: UIButton {
    override func awakeFromNib() {
        layer.cornerRadius = frame.size.height/2
        layer.borderColor = THEME_COLOR.cgColor
        layer.borderWidth = 1.0
        
//        backgroundColor = THEME_COLOR
//        titleLabel?.font = UIFont (name: MediumFont, size: 12)
//        setTitleColor(UIColor.white, for: .normal)
    }
    
    
}
class DeleteButton: UIButton {
    override func awakeFromNib() {
        layer.cornerRadius = frame.size.height/2
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 1.0
        //        backgroundColor = THEME_COLOR
        //        titleLabel?.font = UIFont (name: MediumFont, size: 12)
        //        setTitleColor(UIColor.white, for: .normal)
    }
    
    
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

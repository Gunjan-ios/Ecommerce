//
//  CustomTextfiled.swift
//  InitialWork
//
//  Created by Gunjan on 03/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import TextFieldEffects

class MyTextfiled: MadokaTextField {
    override func awakeFromNib(){
        borderColor = UIColor .white
        textColor = UIColor.white
        placeholderColor = UIColor .gray
    }
}

class BoldLabel: UILabel {
    override func awakeFromNib(){
        self.font = UIFont (name: BoldFont, size: UIFont.systemFontSize)
        print(UIFont.systemFontSize)
    }
}
class mediumLabel: UILabel {
    override func awakeFromNib(){
        self.font = UIFont (name: MediumFont, size: UIFont.systemFontSize)
    }
}
class SemiboldLabel: UILabel {
    override func awakeFromNib(){
        self.font = UIFont (name: SemiBoldFont, size: UIFont.systemFontSize)
    }
}

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

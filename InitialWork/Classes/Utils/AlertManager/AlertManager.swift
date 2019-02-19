//
//  AlertManager.swift
//  Matchfit
//
//  Created by Gunjan Raval on 23/08/18.
//  Copyright © 2018 Gunjan. All rights reserved.
//
//

import Foundation
import LIHAlert


class AlertManager: LIHAlertManager {

    static let errorColor = ERROR_COLOR
    static let successColor = SUCCESS_COLOR

    static func getErrorAlert() -> LIHAlert
    {
        let alert = super.getTextAlert(message: Strings.Common.defaultFailedMessage)
        alert.alertColor = errorColor
        alert.alertAlpha = 1.0
        alert.autoCloseTimeInterval = 2.0
        
        if UIScreen.main.bounds.size.height == 812
        {
                    alert.alertHeight += 20
                    alert.paddingTop += 10

        }
      if UIScreen.main.bounds.size.height == 896
        {
            alert.alertHeight += 30
            alert.paddingTop += 15

        }

        return alert
    }

    static func getErrorAlertNoNavBar() -> LIHAlert {

        let alert = super.getTextAlert(message: Strings.Common.defaultFailedMessage)
        alert.alertColor = errorColor
        alert.alertAlpha = 1.0
        alert.autoCloseTimeInterval = 2.0
        alert.hasNavigationBar = false
        alert.alertHeight += 20
        alert.paddingTop += 10
        return alert
    }
}


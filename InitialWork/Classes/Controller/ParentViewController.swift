//
//  ParentViewController.swift
//  GEM
//
//  Created by Gunjan Raval on 8/23/18.
//  Copyright © 2018 Gunjan Raval. All rights reserved.
//

import UIKit
import LIHAlert

class ParentViewController: UIViewController{
   

    // ----------------------------------------------------------
    // MARK: Private Members
    // ----------------------------------------------------------
    var alert: LIHAlert?
    var alertNoNavBar: LIHAlert?
    var APP = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.initAlerts()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true

        }
        
//        if UserDefaults.standard.object(forKey: uLATITUDE) != nil && UserDefaults.standard.object(forKey: uLOGNITUDE) != nil
//        {
//            latitude = UserDefaults.standard.object(forKey: uLATITUDE) as! String
//            longitude = UserDefaults.standard.object(forKey: uLOGNITUDE) as! String
//        }
//        UDID =  KeychainManager() .getDeviceIdentifierFromKeychain()
//
//        let countryLocale = NSLocale.current
//        let countryCode = countryLocale.regionCode
//        let country = (countryLocale as NSLocale).displayName(forKey: NSLocale.Key.countryCode, value: countryCode!)
//        print(countryCode!, country!)
//        country_region = country!
    
//    }
    
    func initAlerts() {
        self.alert = AlertManager.getErrorAlert()
        self.alertNoNavBar = AlertManager.getErrorAlertNoNavBar()
        self.alert?.initAlert(self.view)
        self.alertNoNavBar?.initAlert(self.view)
    }

    func showAlert(message: String, type: AlertType, navBar: Bool) {

        let alt = navBar ? alert : alertNoNavBar

        if type == AlertType.success {
            alt?.alertColor = AlertManager.successColor
        } else if type == AlertType.error {
            alt?.alertColor = AlertManager.errorColor
        }

        alt?.contentText = message
        alt?.show(nil, hidden: nil)
    }
    
    func showAlert(title: String?, message: String?, yesAction: UIAlertAction, noAction: UIAlertAction) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(noAction)
        alert.addAction(yesAction)
        
        self.showDetailViewController(alert, sender: self)
    }
    

}

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
    var processingAlert: LIHAlert?
    var alertNoNavBar: LIHAlert?
    var APP = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.initAlerts()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true

       if APP.open_count == 1
       {
        APP.open_count = 0
        NotificationCenter.default.addObserver(self, selector: #selector(self.networkStatusChanged(_:)), name: NSNotification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()
        }
        
        }
    
    @objc func networkStatusChanged(_ notification: Notification) {

        let status = Reach().connectionStatus()
        switch status {
        case .unknown, .offline:
            print("Not connected")
            APP.open_count = 2
//             Hud.show(message: Strings.Common.Internet)
                    self.processingAlert?.show(nil, hidden: nil)
         case .online(.wwan):
            print("Connected via WWAN")
            self.processingAlert?.hideAlert({ () -> () in
                if self.APP.open_count == 2 {
                    self.APP.open_count = 0
//                    Hud.showSuccess(message: Strings.Common.Connected)
                    self.showAlert(message: Strings.Common.Connected, type: AlertType.success, navBar: true)
                }
                    })
        case .online(.wiFi):
            print("Connected via WiFi")

            self.processingAlert?.hideAlert({ () -> () in
                if self.APP.open_count == 2 {
                    self.APP.open_count = 0
//                    Hud.showSuccess(message: Strings.Common.Connected)
                    self.showAlert(message: Strings.Common.Connected, type: AlertType.success, navBar: true)
                }
                    })
        }
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
        self.processingAlert = AlertManager.FetchErrorAlert()
        self.alert?.initAlert(self.view)
        self.alertNoNavBar?.initAlert(self.view)
        self.processingAlert?.initAlert(self.view)
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

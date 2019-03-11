//
//  LoginVC.swift
//  InitialWork
//
//  Created by Gunjan on 19/02/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import TextFieldEffects
import KOLocalizedString
import Pastel

class LoginVC: ParentViewController ,UITextFieldDelegate{

    // ----------------------------------------------------------
    // MARK: IB Outlets
    // ----------------------------------------------------------
   
    @IBOutlet weak var txt_User: MadokaTextField!
    @IBOutlet weak var txt_Password: MadokaTextField!
    @IBOutlet weak var btn_Login: UIButton!
    @IBOutlet weak var btn_check: UIButton!
    @IBOutlet weak var LNbutton: UIBarButtonItem!
    @IBOutlet weak var termCondition: ThemeColorButton!
    
    @IBOutlet weak var Forgotpassword: ThemeColorButton!
    
    @IBOutlet weak var btn_signup: ThemeColorButton!
    // ----------------------------------------------------------
    //MARK:- Viewload
    // ----------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = THEME_COLOR
        self.btn_Login.layer.cornerRadius = self.btn_Login.frame.size.height/2
        txt_User.delegate = self
        txt_Password.delegate = self
        MadokaTextField.appearance().tintColor = .red
        settings()
        
        
//        txt_User .becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    //––––––––––––––––––––––––––––––––––––––––
    //MARK: - Settings -
    //––––––––––––––––––––––––––––––––––––––––
    private func settings(){
        self.localizedSettings()
        self.registerNotifications()
//        self.AutoColorChnages()
    }
    func AutoColorChnages(){
        
        let pastelView = PastelView(frame: view.bounds)
        
        //MARK: -  Custom Direction
        
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        
        //MARK: -  Custom Duration
        
        pastelView.animationDuration = 3.0
        
        //MARK: -  Custom Color
        
        pastelView.setColors([
                             UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 0.5),
                              UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 0.5),
                              UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 0.5),
                              UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 0.5),
                              UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 0.5),
                              UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 0.5),
                              UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 0.5)])
        
        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)
    }
    //––––––––––––––––––––––––––––––––––––––––
    //MARK: - Loclized Setting -
    //––––––––––––––––––––––––––––––––––––––––
    ///  Base settings localized  elements on area view controller
    private func localizedSettings()
    {
        
        self.title = KOLocalizedString(Language.Login.Login)
        self.txt_User.placeholder = KOLocalizedString(Language.Login.UserName)
        self.txt_Password.placeholder = KOLocalizedString(Language.Login.Password)
        self.btn_Login.setTitle(KOLocalizedString(Language.Login.Login), for: .normal)
        Forgotpassword.setTitle(KOLocalizedString(Language.Login.ForgetPassword), for: .normal)
        btn_signup.setTitle(KOLocalizedString(Language.Login.DontAccount), for: .normal)
        termCondition.setTitle(KOLocalizedString(Language.Login.TermsConditions), for: .normal)



    }
    //––––––––––––––––––––––––––––––––––––––––
    //MARK: - Notification -
    //––––––––––––––––––––––––––––––––––––––––
    /// Register notifications
    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateLocalized), name: KODidUpdateDictionary, object: nil)
    }
//    KODidChangeLanguage.Login
    /// Function for notification
    @objc private func updateLocalized(){
        DispatchQueue.main.async {
            self.localizedSettings()
        }
    }
    //––––––––––––––––––––––––––––––––––––––––
    //MARK: - Actions -
    //––––––––––––––––––––––––––––––––––––––––
    /// Function for change localization
    @IBAction func Onpressd(_ sender: UIBarButtonItem) {
          OnLanguagePressed()
//        KOSetLanguage.Login((LNbutton != nil) ? "hi":"en")
//          registerNotifications()
    }
    
     
    // ----------------------------------------------------------
    //MARK:- validation method
    // ----------------------------------------------------------
    
    private func validateFields() -> Bool {
        
        let validation = Validation()
        
        if !self.txt_User.notEmpty() || !validation.isValidName(name: txt_User.text!.trim()) {
            self.showAlert(message:  KOLocalizedString(Strings.Login.invalidName), type: AlertType.error, navBar: true)
            return false
        }
        
        if !self.txt_Password.notEmpty() || !validation.isValidPassword(Password: txt_Password.text!.trim()){
            self.showAlert(message:  KOLocalizedString(Strings.Login.invalidpasswrod), type: AlertType.error, navBar: true)
            return false
        }
        if btn_check.isSelected != true
        {
            self.showAlert(message:  KOLocalizedString(Strings.Login.Terms), type: AlertType.error, navBar: true)
        }
    
        return true
    }
    
    // ----------------------------------------------------------
    //MARK:- Action method
    // ----------------------------------------------------------

    @IBAction func OnSubmitPressed(_ sender: Any)
    {
        Hud.show(message: "Please Wait...")
        
        if validateFields()
        {
//            self.performSegue(withIdentifier: "LogintoHome", sender: self)
            
        }
    
        Hud.dismiss()

    }
    
    @IBAction func OnTCPressed(_ sender: UIButton) {

        btn_check.isSelected = !btn_check.isSelected
    }
    
    // ----------------------------------------------------------
    //MARK:- TextField Method
    // ----------------------------------------------------------
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == txt_User
        {
            txt_User.resignFirstResponder()
            txt_Password.becomeFirstResponder()
        }
        else{
//            self.OnSubmitPressed(self)
            txt_Password.resignFirstResponder()
        }
        return false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

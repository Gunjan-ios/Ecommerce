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

class LoginVC: ParentViewController ,UITextFieldDelegate{

    // ----------------------------------------------------------
    // MARK: IB Outlets
    // ----------------------------------------------------------
   
    @IBOutlet weak var txt_User: MyTextfiled!
    @IBOutlet weak var txt_Password: MyTextfiled!
    @IBOutlet weak var btn_Login: UIButton!
    @IBOutlet weak var btn_check: UIButton!
    @IBOutlet weak var LNbutton: UIBarButtonItem!
    @IBOutlet weak var termCondition: ThemeColorButton!
    @IBOutlet weak var ORlabel: ThemeColorButton!
    @IBOutlet weak var Forgotpassword: RegularFontButton!
    
    @IBOutlet weak var btn_signup: ThemeColorButton!
    
    @IBOutlet weak var view1: UIView!
    
    
    
    // ----------------------------------------------------------
    //MARK:- Viewload
    // ----------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = THEME_COLOR
        self.btn_Login.layer.cornerRadius = self.btn_Login.frame.size.height/2
        txt_User.delegate = self
        txt_Password.delegate = self
        MadokaTextField.appearance().tintColor = TXT_CLUSER_COLOR
        settings()
        
               
        
        
//        txt_User .becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    //––––––––––––––––––––––––––––––––––––––––
    //MARK: - Settings -
    //–––––––––––––––––––––––––––––––––––––––– ---––≠≠≠≠≠±±
    
    private func settings(){
        self.localizedSettings()
        self.registerNotifications()
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
        ORlabel.setTitle(KOLocalizedString(Language.Login.OR), for: .normal)

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
            self.showAlert(message:  KOLocalizedString(Strings.Login.invalidName), type: AlertType.error, navBar: false)
            return false
        }
        
        if !self.txt_Password.notEmpty() || !validation.isValidPassword(Password: txt_Password.text!.trim()){
            self.showAlert(message:  KOLocalizedString(Strings.Login.invalidpasswrod), type: AlertType.error, navBar: false)
            return false
        }
        if btn_check.isSelected != true
        {
            self.showAlert(message:  KOLocalizedString(Strings.Login.Terms), type: AlertType.error, navBar: false)
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

//
//  ResetPasswordVC.swift
//  InitialWork
//
//  Created by Gunjan on 03/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import TextFieldEffects
import KOLocalizedString

class ResetPasswordVC: ParentViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var txt_password: MyTextfiled!
    @IBOutlet weak var txt_confirmPassword: MyTextfiled!

    @IBOutlet weak var btn_submit: UIButton!
    @IBOutlet weak var lbl_text: UILabel!
    @IBOutlet weak var blurview: UIView!
     @IBOutlet weak var blur: UIVisualEffectView!
    override func viewDidLoad() {
        super.viewDidLoad()
        txt_password.delegate = self
        txt_confirmPassword.delegate = self
        MadokaTextField.appearance().tintColor = TXT_CLUSER_COLOR
        self.btn_submit.layer.cornerRadius = self.btn_submit.frame.size.height/2
        self.blur.clipsToBounds = true;
        self.blur.layer.cornerRadius = self.blur.frame.size.height/2
        settings()
        // Do any additional setup after loading the view.
    }
    //––––––––––––––––––––––––––––––––––––––––
    //MARK: - Settings -
    //––––––––––––––––––––––––––––––––––––––––
    
    private func settings(){
        self.localizedSettings()
        //        self.registerNotifications()
    }
    
    //––––––––––––––––––––––––––––––––––––––––
    //MARK: - Loclized Setting -
    //––––––––––––––––––––––––––––––––––––––––
    ///  Base settings localized  elements on area view controller
    private func localizedSettings()
    {
        self.title = KOLocalizedString(Language.Login.ForgetTitle)
        self.txt_password.placeholder = KOLocalizedString(Language.Login.Password)
        self.txt_confirmPassword.placeholder = KOLocalizedString(Language.Login.ConfirmPassword)
        lbl_text.text = KOLocalizedString(Language.ResetPassword
            .title_text)
        self.btn_submit.setTitle(KOLocalizedString(Language.ResetPassword.btnreset), for: .normal)
        
    }
    private func validateFields() -> Bool {
        
        let validation = Validation()
        
        if !self.txt_password.notEmpty() || !validation.isValidPassword(Password: (txt_password.text?.trim())!) {
            self.showAlert(message:  KOLocalizedString(Strings.Login.invalidpasswrod), type: AlertType.error, navBar: true)
            return false
        }
        if !self.txt_confirmPassword.notEmpty() || !validation.isValidPassword(Password: (txt_confirmPassword.text?.trim())!) {
            self.showAlert(message:  KOLocalizedString(Strings.Login.invalidConfirmpasswrod), type: AlertType.error, navBar: true)
            return false
        }
        if  txt_confirmPassword.text?.trim() != txt_password.text?.trim() {
            self.showAlert(message:  KOLocalizedString(Strings.Login.ConfrimPasswrod), type: AlertType.error, navBar: true)
            return false
        }
        
        return true
    }
    // ----------------------------------------------------------
    //MARK:- Action method
    // ----------------------------------------------------------
    
    @IBAction func OnSubmitPressed(_ sender: Any)
    {
        if validateFields()
        {
            Hud.showSuccess(message: Strings.Common.pushdata)
            //            self.performSegue(withIdentifier: "LogintoHome", sender: self)
        }
    }
    @IBAction func onBackPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // ----------------------------------------------------------
    //MARK:- TextField Method
    // ----------------------------------------------------------
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == txt_password
        {
            txt_confirmPassword.becomeFirstResponder()
        }
        else if textField == txt_confirmPassword
        {
            txt_confirmPassword.resignFirstResponder()
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

//
//  RegisterVC.swift
//  InitialWork
//
//  Created by Gunjan on 21/02/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import TextFieldEffects

class RegisterVC: ParentViewController,UITextFieldDelegate {
    // ----------------------------------------------------------
    // MARK: IB Outlets
    // ----------------------------------------------------------
    
    @IBOutlet weak var img_profile: UIImageView!
    @IBOutlet weak var txt_User: MadokaTextField!
    @IBOutlet weak var txt_email: MadokaTextField!
    @IBOutlet weak var txt_Password: MadokaTextField!
    @IBOutlet weak var txt_ConfirmPassword: MadokaTextField!
    @IBOutlet weak var btn_submit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txt_User.delegate = self
        txt_Password.delegate = self
        txt_email.delegate = self
        txt_ConfirmPassword.delegate = self
        MadokaTextField.appearance().tintColor = .red
        self.btn_submit.layer.cornerRadius = self.btn_submit.frame.size.height/2
        self.img_profile.layer.cornerRadius = self.img_profile.frame.size.height/2

        // Do any additional setup after loading the view.
    }
    private func validateFields() -> Bool {
        
        let validation = Validation()
        
        if !self.txt_User.notEmpty() || !validation.isValidName(name: txt_User.text!.trim()) {
            self.showAlert(message: Strings.Login.invalidName, type: AlertType.error, navBar: true)
            return false
        }
        
        if !self.txt_email.notEmpty() || !validation.isValidEmail(email: txt_email.text!.trim()) {
            self.showAlert(message: Strings.Login.invalidEmail, type: AlertType.error, navBar: true)
            return false
        }
        
        if !self.txt_Password.notEmpty() || !validation.isValidPassword(Password: txt_Password.text!.trim()){
            self.showAlert(message: Strings.Login.invalidpasswrod, type: AlertType.error, navBar: true)
            return false
        }
        
        if !self.txt_ConfirmPassword.notEmpty() || !validation.isValidPassword(Password: txt_ConfirmPassword.text!.trim()){
            self.showAlert(message: Strings.Login.invalidpasswrod, type: AlertType.error, navBar: true)
            return false
        }
        if  self.txt_ConfirmPassword.text!.trim() != self.txt_Password.text!.trim(){
            self.showAlert(message: Strings.Login.ConfrimPasswrod, type: AlertType.error, navBar: true)
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
    // ----------------------------------------------------------
    //MARK:- TextField Method
    // ----------------------------------------------------------
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == txt_User
        {
//            txt_User.resignFirstResponder()
            txt_email.becomeFirstResponder()
        }
       else if textField == txt_email
        {
//            txt_email.resignFirstResponder()
            txt_Password.becomeFirstResponder()
        }
       else if textField == txt_Password
        {
//            txt_User.resignFirstResponder()
            txt_ConfirmPassword.becomeFirstResponder()
        }
        else{
            //            self.OnSubmitPressed(self)
            txt_ConfirmPassword.resignFirstResponder()
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

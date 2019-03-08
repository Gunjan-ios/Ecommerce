//
//  ForgotPassword.swift
//  InitialWork
//
//  Created by Gunjan on 08/03/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import TextFieldEffects
import KOLocalizedString

class ForgotPassword: ParentViewController,UITextFieldDelegate {

    @IBOutlet weak var txt_email: MadokaTextField!
    @IBOutlet weak var btn_submit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txt_email.delegate = self
        MadokaTextField.appearance().tintColor = .red
        self.btn_submit.layer.cornerRadius = self.btn_submit.frame.size.height/2
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
        self.txt_email.placeholder = KOLocalizedString(Language.Login.Email)
        self.btn_submit.setTitle(KOLocalizedString(Language.Login.Submit), for: .normal)
        
    }
    private func validateFields() -> Bool {
        
        let validation = Validation()
        
        if !self.txt_email.notEmpty() || !validation.isValidEmail(email: txt_email.text!.trim()) {
            self.showAlert(message:  KOLocalizedString(Strings.Login.invalidEmail), type: AlertType.error, navBar: true)
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
       textField.resignFirstResponder()
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

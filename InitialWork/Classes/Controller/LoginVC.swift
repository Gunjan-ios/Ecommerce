//
//  LoginVC.swift
//  InitialWork
//
//  Created by Gunjan on 19/02/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import TextFieldEffects

class LoginVC: ParentViewController ,UITextFieldDelegate{

    // ----------------------------------------------------------
    // MARK: IB Outlets
    // ----------------------------------------------------------
   
    @IBOutlet weak var txt_User: MadokaTextField!
    @IBOutlet weak var txt_Password: MadokaTextField!
    @IBOutlet weak var btn_Login: UIButton!
    @IBOutlet weak var btn_check: UIButton!
    

    // ----------------------------------------------------------
    //MARK:- Viewload
    // ----------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        self.btn_Login.layer.cornerRadius = self.btn_Login.frame.size.height/2
        
        txt_User.delegate = self
        txt_Password.delegate = self
        
        MadokaTextField.appearance().tintColor = .red
       

//        txt_User .becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    // ----------------------------------------------------------
    //MARK:- validation method
    // ----------------------------------------------------------
    
    private func validateFields() -> Bool {
        
        let validation = Validation()
        
        if !self.txt_User.notEmpty() || !validation.isValidName(name: txt_User.text!.trim()) {
            self.showAlert(message: Strings.Login.invalidName, type: AlertType.error, navBar: true)
            return false
        }
        
        if !self.txt_Password.notEmpty() || !validation.isValidPassword(Password: txt_Password.text!.trim()){
            self.showAlert(message: Strings.Login.invalidpasswrod, type: AlertType.error, navBar: true)
            return false
        }
        if btn_check.isSelected != true
        {
            self.showAlert(message: Strings.Login.Terms, type: AlertType.error, navBar: true)
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

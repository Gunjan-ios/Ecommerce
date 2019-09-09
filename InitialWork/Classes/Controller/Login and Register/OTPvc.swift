//
//  OTPvc.swift
//  InitialWork
//
//  Created by Gunjan on 04/09/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import TextFieldEffects
import KOLocalizedString
import JAPinView

class OTPvc: ParentViewController,UITextFieldDelegate  {
    
    @IBOutlet weak var btn_submit: UIButton!
    @IBOutlet weak var lbl_text: UILabel!
    @IBOutlet weak var lblVerify: UILabel!
    @IBOutlet weak var blurview: UIView!
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var txt_email: MyTextfiled!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var pinView: JAPinView!
    
    var formregister : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settings()

        pinView.onSuccessCodeEnter = { pin in
//            self.alert(pin: pin)
            print(pin)
        }
        
        if formregister{
            print("true")
        }
        
        // Do any additional setup after loading the view.
    }
    //––––––––––––––––––––––––––––––––––––––––
    //MARK: - Settings -
    //––––––––––––––––––––––––––––––––––––––––
    
    private func settings(){
//        txt_email.delegate = self
        
        MadokaTextField.appearance().tintColor = TXT_CLUSER_COLOR
        self.btn_submit.layer.cornerRadius = self.btn_submit.frame.size.height/2
        self.blur.clipsToBounds = true;
        self.blur.layer.cornerRadius = self.blur.frame.size.height/2
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
//        self.txt_email.placeholder = KOLocalizedString(Language.Login.Email)
        lbl_text.text = KOLocalizedString(Language.OTP.title_text)
        lblVerify.text = KOLocalizedString(Language.OTP.txtverify)
        lbl_text.largeText()
        lblVerify.changefontandsize(font: MediumFont, size: 17)
//        email.text = KOLocalizedString(Language.OTP.txtverify)
    
        self.btn_submit.setTitle(KOLocalizedString(Language.Login.Submit), for: .normal)
        
    }
    private func validateFields() -> Bool {
        
        let validation = Validation()
        
        if !self.txt_email.notEmpty() || !validation.isValidEmail(email: txt_email.text!.trim()) {
            self.showAlert(message:  KOLocalizedString(Strings.Login.invalidEmail), type: AlertType.error, navBar: false)
            return false
        }
        
        return true
    }
    // ----------------------------------------------------------
    //MARK:- Action method
    // ----------------------------------------------------------
    
    @IBAction func OnSubmitPressed(_ sender: Any)
    {
        if formregister{
            let Home = self.storyboard?.instantiateViewController(withIdentifier: Strings.Identifiers.HomeVC) as! HomeVC
            self.navigationController?.pushViewController(Home, animated: true)
        }
        else{
            let Home = self.storyboard?.instantiateViewController(withIdentifier: Strings.Identifiers.ResetPasswordVC) as! ResetPasswordVC
            self.navigationController?.pushViewController(Home, animated: true)
        }
//        if validateFields()
//        {
//            Hud.showSuccess(message: Strings.Common.pushdata)
//            //            self.performSegue(withIdentifier: "LogintoHome", sender: self)
//        }
    }
    @IBAction func onBackPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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

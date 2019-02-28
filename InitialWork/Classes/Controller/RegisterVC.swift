//
//  RegisterVC.swift
//  InitialWork
//
//  Created by Gunjan on 21/02/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import UIKit
import TextFieldEffects
import KOLocalizedString

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
        
        self.title = KOLocalizedString(Language.Login.SignUp)
        self.txt_User.placeholder = KOLocalizedString(Language.Login.UserName)
        self.txt_email.placeholder = KOLocalizedString(Language.Login.Email)
        self.txt_Password.placeholder = KOLocalizedString(Language.Login.Password)
        self.txt_ConfirmPassword.placeholder = KOLocalizedString(Language.Login.ConfirmPassword)
        self.btn_submit.setTitle(KOLocalizedString(Language.Login.Submit), for: .normal)
        
        
        
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
    
    
    
    
//    //    TODO:- IMAGE PROFILE
//    
//    private func photoFromCamera() {
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            let imagePicker = UIImagePickerController()
//            imagePicker.delegate = self
//            imagePicker.sourceType = .camera;
//            imagePicker.allowsEditing = false
//            self.present(imagePicker, animated: true, completion: nil)
//        }
//    }
//    
//    private func photoFromLibrary()
//    {
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
//        {
//            let imagePicker = UIImagePickerController()
//            imagePicker.delegate = self
//            imagePicker.sourceType = .photoLibrary;
//            imagePicker.allowsEditing = true
//            self.present(imagePicker, animated: true, completion: nil)
//        }
//    }
//    
//    @IBAction func onProfilePicturePressed(_ sender: Any) {
//        let alertController = UIAlertController(title: Strings.TrainerProfileUpdate.pictureUpdateTitle, message: nil, preferredStyle: .actionSheet)
//        
//        let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
//            self.photoFromCamera()
//        }
//        alertController.addAction(cameraAction)
//        
//        let libraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
//            self.photoFromLibrary()
//        }
//        alertController.addAction(libraryAction)
//        
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in }
//        alertController.addAction(cancelAction)
//        
//        self.present(alertController, animated: true)
//    }
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
//    {
//        let original_image = info[UIImagePickerControllerOriginalImage] as! UIImage
//        dismiss(animated:true, completion: nil)
//    }
//    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

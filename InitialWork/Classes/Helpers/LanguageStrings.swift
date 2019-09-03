//
//  LanguageStrings.swift
//  InitialWork
//
//  Created by Gunjan on 28/02/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import Foundation
class  Language {
    
    struct Login
    {
//        static let DontAccount = NSLocalizedString("Don't have a Account? SignUp", comment: "Don't have a Account? SignUp")

        static let DontAccount  = "Don't have a Account? SignUp"
        static let  Email = "Email"
        static let  Submit   = "Submit"
        static let  ForgetPassword = "Forget password?"
        static let UserName = "UserName"
        static let SignUp = "Sign Up"
        static let Login = "Secure Login"
        static let TermsConditions = "Terms & Conditions"
        static let  Password = "Password"
        static let  Mobile = "Mobile"
        static let ConfirmPassword = "Confirm Password"
        static let  ForgetTitle = "Forget password"
        static let  OR = "OR"
        

    }
    
    struct ForgotPassword {
        static let  lbltext = "We just need \nyour registered email id \nto sent a OTP \nfor reset password."
        static let btnverify = "VERIFY ACCOUNT"
    }
    struct ResetPassword {
        static let title_text = "Enter new password \nto reset your account"
        static let btnreset = "RESET ACCOUNT"
    }
    struct Common {
        static let   ChooseOption = "Choose Option"
        static let  ChooseLanguage = "Choose Language"
        static let  Hindi = "Hindi"
        static let  English   = "English"
        static let  Camera = "Camera"
        static let  PhotoLibrary   = "Photo Library"
        static let  Cancel   = "Cancel"
        
        static let waiting = "Please wait..."
        static let defaultFailedMessage = "Failed. Please try again."
        static let Connected = "Internet connected."
        static let NoData = "Data not Found."
        static let Internet = "Check your internet connection."
        static let FetchData = "Fetching data..."
    }
    
}

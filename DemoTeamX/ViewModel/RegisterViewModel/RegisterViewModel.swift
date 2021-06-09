//
//  RegisterViewModel.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import Foundation
    //MARK:- POP Protocol RegisterViewModel
protocol RegisterViewModelProtocol:class {
    func enterDataRegister(name:String, email:String, password: String, phone: String, image:String)
}

class RegisterViewModel{
    
    //MARK:- Private Properties
    private let view: RegisterVCProtocol?
    
    //MARK:- initialization
    init(view:RegisterVCProtocol) {
        self.view = view
    }
    
    //MARK:- Validation Method
    
    private func validation(name:String, email:String, password:String, phone:String, image:String) -> Bool {
        
        ///////Name////////
        if !ValidationManager.shared().isEmptyName(name: name) {
            self.view?.showAlert(message: """
Please Enter Username
name must contain more  at least 3 characters
""")
            return false
        }
        
        ///////Email////////
        if !ValidationManager.shared().isEmptyEmail(email: email) {
            self.view?.showAlert(message: "Please Enter Email Address")
            return false
        }
        if !ValidationManager.shared().isValidEmail(email: email){
            self.view?.showAlert(message: """
Please Enter Email Address Valid
    example@yahoo.com
""")
            return false
        }
     
        ///////PasswordEmapty////////
        if !ValidationManager.shared().isEmptyPassword(password: password) {
            self.view?.showAlert(message: "Please Enter Password")
            return false
        }
        
        ////////Password Valid///////
        if !ValidationManager.shared().isValidPassword(password: password) {
            self.view?.showAlert(message: """
Password Not Valid
Passowrd contain at least six characters, including Uppercase
,loawercase latters and numbers
""")
            return false
        }
        
        ///////Mobile////////
        if !ValidationManager.shared().isEmptyMobile(mobile: phone) {
            self.view?.showAlert(message: """
Please Enter Mobile Number
must contian 10-digit phone number
""")
            return false
        }
        return true
    }
    
    
    //MARK:- post Data to APIs
    private func inputDataRegister(name: String, email: String, password: String, phone: String, image: String) {
        print("before API")
        self.view?.showLoader()
        
        APIManager.register(name: name, email: email, password: password, phone: phone, image: image){ response in
            print("In API")
            switch response {
            case .failure(let error):
                return print(error)
            case .success(let result):
                print(result.data?.token ?? "")
                UserDefaultsManager.shared().token = result.data?.token
                print("successfully send data SignUp To API")
                self.view?.goToMap()
            }
        }
        self.view?.hideLoader()
    }
}
    //MARK:- Confirm Protocol RegViewModel
extension RegisterViewModel: RegisterViewModelProtocol{
    func enterDataRegister(name: String, email: String, password: String, phone: String, image: String) {
        if validation(name: name, email: email, password: password, phone: phone, image: image){
            inputDataRegister(name: name, email: email, password: password, phone: phone, image: image)
        }
    }
}

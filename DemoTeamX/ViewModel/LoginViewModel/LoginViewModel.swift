//
//  LoginViewModel.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import Foundation
    //MARK:- POP protocol loginViewModel
protocol LoginViewModelProtocol:class {
    func enterDataLogin(email: String, password:String)
}


class LoginViewModel {
    
    //MARK:- private Properties
    private var view:LoginVCProtocol?
    
    //MARK:- init Class
    init(view:LoginVCProtocol) {
        self.view = view
    }
    
    //MARK:- validation Methods
    private func validationData(email:String, password:String) -> Bool {
        if !ValidationManager.shared().isEmptyEmail(email: email){
            view?.showAlert(message: "Please Enter Email Address")
            return false
        }
        
        if !ValidationManager.shared().isValidEmail(email: email){
            view?.showAlert(message: """
Please Enter Email Address Valid
    example@yahoo.com
""")
            return false
        }
        
        if !ValidationManager.shared().isEmptyPassword(password: password){
            view?.showAlert(message: "Please Enter Password")
            return false
        }
        
        if !ValidationManager.shared().isValidPassword(password: password){
            view?.showAlert(message: """
Please Enter Passowrd
contian 6 characters and 6 digit
""")
            return false
        }
        return true
    }
    
    //MARK:- func post data to API
    func inPutLoginData(email:String, password:String) {
        self.view?.showLoader()
        APIManager.login(email: email, password: password) { response in
            switch response {
            case .failure(let error):
                return print(error)
            case .success(let result):
                print(result.data?.id)
                UserDefaultsManager.shared().token = result.data?.token
                UserDefaultsManager.shared().isLoggedIn = true
                print("success login API")
                self.view?.goToMap()
            }
            self.view?.hideLoader()
        }
        
        
    }
    
}
    //MARK:- Confirm Protocol LoginViewModel
extension LoginViewModel:LoginViewModelProtocol{
    func enterDataLogin(email: String, password: String) {
        if validationData(email: email, password: password){
            inPutLoginData(email: email, password: password)
        }
    }
    
    
}

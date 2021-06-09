//
//  LoginVC.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import UIKit
//MARK:- Protocol Class LoginVC
protocol LoginVCProtocol:class{
    func showLoader()
    func hideLoader()
    func showAlert(message:String)
    func goToSignUp()
    func goToMap()
}

class LoginVC: UIViewController {
    
    //MARK:- OutLest
    @IBOutlet var loginView: LoginView!
    
    //MARK:- Properties
    private var viewModel:LoginViewModel?
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.setUpLogin()
        /////////////
        
    }
    
    class func create() -> LoginVC {
        let loginVC: LoginVC = UIViewController.create(storyboardName: Storyboards.auth, identifier: viewControllers.loginVC)
        //////////
        loginVC.viewModel = LoginViewModel(view: loginVC)
        return loginVC
    }
    
    //MARK:- IBActions Buttons
    @IBAction func loginBtn(_ sender: Any) {
        viewModel?.enterDataLogin(email: loginView.emailTxt.text ?? "" , password: loginView.passwordTxt.text ?? "" )
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        goToSignUp()
    }
}

    //MARK:- Confirm Protocol Class
extension LoginVC:LoginVCProtocol{
    
    func goToSignUp() {
        let regVC = RegisterVC.create()
        self.navigationController?.pushViewController(regVC, animated: true)
    }
    func showLoader() {
        loginView?.showLoading()
    }
    func hideLoader() {
        loginView?.hideLoading()
    }
    func showAlert(message:String){
        showAlert(title: "Sorry", message: message, okTitle: "Ok", okHandler: nil)
    }
    func goToMap() {
        let mapvc = MapVC.create()
        self.navigationController?.present(mapvc, animated: true, completion: nil)
    }
    
}

//
//  MainVC.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import UIKit

    //MARK:- POP ProtocolMainVC
protocol MainVCProtocol:class {
    func showAlert(message:String)
    func goToMap()
    func goToSignUp()
    func showLoader()
    func hideLoader()
    func goToLogin()
    func goToMapVC()
}

class MainVC: UIViewController {

    //MARK:- OutLets
    @IBOutlet var mainView: MainView!
    
    //MARK:- Properties
    private var viewModel:MainViewModelProtocol?
    
    //MARK:- lifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MainViewModel(view:self)
        mainView.setUp()
    }
    
    class func create() -> MainVC {
        let loginVC: MainVC = UIViewController.create(storyboardName: Storyboards.auth, identifier: viewControllers.mainVC)
        return loginVC
    }
    
    //MARK:- IBActionButtons
    @IBAction func signUpBtnTapped(_ sender: Any) {
        self.viewModel?.goToSinUp()
    }
    
    @IBAction func signInBtnTapped(_ sender: Any) {
        self.viewModel?.goToLogin()
    }
    
    @IBAction func mapBtnTapped(_ sender: Any) {
        self.viewModel?.goToMap()
    }
    
}

    //MARK:- Confirm Protocol MainVC
extension MainVC: MainVCProtocol {
    func goToMapVC() {
        let mapVC = MapVC.create()
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
    func showAlert(message:String){
        showAlert(title: "Sorry", message: message, okTitle: "Ok", okHandler: nil)
    }
    func goToMap() {
        let mapvc = MapVC.create()
        self.navigationController?.present(mapvc, animated: true, completion: nil)
    }
    func goToSignUp() {
        let regVC = RegisterVC.create()
        self.navigationController?.pushViewController(regVC, animated: true)
    }
    func showLoader() {
        mainView?.showLoading()
    }
    func hideLoader() {
        mainView?.hideLoading()
    }
    func goToLogin() {
        let loginVC = LoginVC.create()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    
}

//
//  MainViewModel.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import Foundation

    //MARK:- POP ProtocolViewModel
protocol MainViewModelProtocol:class {
    func goToLogin()
    func goToSinUp()
    func goToMap()
}

class MainViewModel: MainViewModelProtocol {
    
    //MARK:- Properties
    private var view:MainVCProtocol?
    
    //MARK:- initialization class
    init(view: MainVCProtocol) {
        self.view = view
    }
    
    //MARK:- functions operations movements 
    func goToLogin( ) {
        self.view?.goToLogin()
    }
    func goToSinUp( ) {
        self.view?.goToSignUp()
    }
    func goToMap() {
        if UserDefaultsManager.shared().isLoggedIn == false {
            self.view?.showAlert(message: "Please login now or register")
        }else{
        self.view?.goToMapVC()
        }
    }
    
    
}

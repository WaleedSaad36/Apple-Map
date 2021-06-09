//
//  MainView.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import UIKit

class MainView: UIView {
    //MARK:- OutLets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var signUpBtn: IDEHospitalButton!
    @IBOutlet weak var signInBtn: IDEHospitalButton!
    @IBOutlet weak var mapBtn: IDEHospitalButton!
    
    //MARK:- SetupView Methods
    func setUp()  {
        setUpButton(Button: signInBtn, TextBtn: "Sign in", colorBtn: .signIn)
        setUpButton(Button: signUpBtn, TextBtn: "Sign up", colorBtn: .signUp)
        setUpButton(Button: mapBtn, TextBtn: "Get Location", colorBtn: .black)
    }
    
    //MARK:- SetUpButtons
    private func setUpButton(Button:IDEHospitalButton ,TextBtn:String, colorBtn: colorButtons) {
        Button.setTitle(TextBtn, for: .normal)
        Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        Button.titleLabel?.textAlignment = .center
        Button.layer.cornerRadius = Button.frame.height / 15
        Button.tintColor = .white
        switch colorBtn {
        case .signUp:
            return Button.backgroundColor = .black
        case .signIn:
            return Button.backgroundColor = UIColor(red: 0 / 255.0, green: 24 / 255.0, blue: 103 / 255.0, alpha: 1.0)
        case .clear:
            return Button.backgroundColor = .clear
        case .black:
            return Button.backgroundColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 1.0)
        }
    }

}

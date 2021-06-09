//
//  RegisterView.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import UIKit

class RegisterView: UIView {
    
    //MARK:- OutLets
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var choosePhotoBtn: UIButton!
    @IBOutlet weak var nameTxt: IDEHospitalTextField!
    @IBOutlet weak var emailTxt: IDEHospitalTextField!
    @IBOutlet weak var passwordTxt: IDEHospitalTextField!
    @IBOutlet weak var mobileTxt: IDEHospitalTextField!
    @IBOutlet weak var registerBtn: IDEHospitalButton!
    
    //MARK:- setup UIView
    func setUpRegister() {
        self.layoutIfNeeded()
        setUpTextFeilds()
        setUpButton(Button: registerBtn, TextBtn: "Sign Up", colorBtn: .signUp)
    }
}

    //MARK:- EX + RegisterView
        extension RegisterView {
      
    //MARK:- Private Methods setup
    private func setupBackground() {
        self.background.backgroundColor = .gray
    }

    //MARK:- SetUp TextFeild
    private func setUpTextField(textField:IDEHospitalTextField, text:String ,leftIcon: UIImage,typeKeyboard:textFieldType){
        textField.addLineView()
        textField.addImage(image: leftIcon)
        let font = UIFont.systemFont(ofSize: 15)
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font: font])
        switch typeKeyboard {
        case .email:
            return textField.keyboardType = .emailAddress
        case .name:
            return textField.keyboardType = .default
        case .phone:
            return textField.keyboardType = .phonePad
        case .password:
            textField.isSecureTextEntry = true
            return textField.keyboardType = .default
        default:
            return textField.keyboardType = .default
        }
    }
    //MARK:- SetUpTextFields
    private func setUpTextFeilds(){
        setUpTextField(textField: emailTxt, text: "Please Enter Email Address", leftIcon: UIImage(named: "EmailIcon")!, typeKeyboard: .email)
        setUpTextField(textField: passwordTxt, text: "Please Enter Password", leftIcon: UIImage(named: "lock")!, typeKeyboard: .password)
        setUpTextField(textField: nameTxt, text: "Please Enter Username", leftIcon: UIImage(named: "User")!, typeKeyboard: .name)
        setUpTextField(textField: mobileTxt, text: "Please Enter Mobile Number", leftIcon: UIImage(named: "MobIcon")!, typeKeyboard: .phone)

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

//
//  RegisterVC.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import UIKit
    //MARK:- Protocol Class
protocol RegisterVCProtocol:class {
    func showLoader()
    func hideLoader()
    func showAlert(message:String)
    func goToMap()
}



class RegisterVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK:- OutLets
    @IBOutlet var registerView:RegisterView!
    
    //MARK:- Properties
    var viewModel: RegisterViewModel?
    let imagePicker = UIImagePickerController()
    
    //MARK:- lifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        registerView.setUpRegister()
        dataSourseIamge()
    }
    
    class func create() -> RegisterVC {
        let registerVC: RegisterVC = UIViewController.create(storyboardName: Storyboards.auth, identifier: viewControllers.registerVC)
        //////////
        registerVC.viewModel = RegisterViewModel(view: registerVC)
        return registerVC
    }
    
    //MARK:- Setup DataSourse Image
    private func dataSourseIamge(){
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let usedImagePicker = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            registerView.imageView.image = usedImagePicker
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK:- IBAction Buttons
    @IBAction func ChoosePhotoBtn(_ sender: Any) {
        self.present(imagePicker,animated: true, completion: nil)
    }
    
    @IBAction func SignUpTapped(_ sender: Any) {
        let strImage = registerView.imageView.image?.jpegData(compressionQuality: 0.5)?.base64EncodedString() ?? ""
        self.viewModel?.enterDataRegister(name: registerView.nameTxt.text ?? "", email: registerView.emailTxt.text ?? "", password: registerView.passwordTxt.text ?? "", phone: registerView.mobileTxt.text ?? "", image: strImage)
    }
}

//MARK:- Confirm Protocol RegVC class
extension RegisterVC:RegisterVCProtocol{
    func goToMap() {
        let mapvc = MapVC.create()
        self.navigationController?.present(mapvc, animated: true, completion: nil)
    }
    
    func showLoader() {
        registerView?.showLoading()
    }
    func hideLoader() {
        registerView?.hideLoading()
    }
    func showAlert(message:String){
        showAlert(title: "Sorry", message: message, okTitle: "Ok", okHandler: nil)
    }
    
}

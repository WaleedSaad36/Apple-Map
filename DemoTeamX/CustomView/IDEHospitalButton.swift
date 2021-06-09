//
//  IDEHospitalButton.swift
//  DemoTeamX
//
//  Created by IDE Academy on 4/1/21.
//  Copyright © 2021 IDE Academy. All rights reserved.
//

import UIKit

class IDEHospitalButton: UIButton {
    
    // MARK:- Public Methods
    func setup(title: String, fontSize: CGFloat = 20) {
        setupRadius()
        setTitle(title, for: .normal)
        setupButtonColors()
        titleLabel?.font = UIFont.init(name: "System", size: 20)
        setupAnimatedBtn()
    }
    
    // MARK:- Private Methods
    private func setupRadius() {
        layoutIfNeeded()
        layer.cornerRadius = 10
    }
    
    private func setupButtonColors() {
        setTitleColor(.white, for: .normal)
        backgroundColor = .gray
    }
    func setupAnimatedBtn(){
    
        let pluse = CASpringAnimation(keyPath: "tranform.scale")
        pluse.duration = 0.6
        pluse.fromValue = 0.95
        pluse.toValue = 1
        pluse.autoreverses = true
        pluse.repeatCount = 2
        pluse.initialVelocity = 0.5
        pluse.damping = 1.0
        layer.add(pluse,forKey:nil)
    }
}

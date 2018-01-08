//
//  DevView.swift
//  FirebaseImages
//
//  Created by Devontae Reid on 1/7/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class DevView: UIView {
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.text = "Welcome"
        return lbl
    }()
    
    let emailTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Email"
        txtField.layer.borderWidth = 1.5
        txtField.layer.borderColor = UIColor.white.cgColor
        txtField.layer.cornerRadius = 10
        txtField.layer.masksToBounds = true
        txtField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        return txtField
    }()
    
    let passwordTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Password"
        txtField.layer.borderWidth = 1.5
        txtField.layer.borderColor = UIColor.white.cgColor
        txtField.layer.cornerRadius = 10
        txtField.layer.masksToBounds = true
        txtField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        return txtField
    }()

    let signInButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sign In", for: .normal)
        btn.layer.borderWidth = 1.5
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        return btn
    }()
    
    let signUpButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sign Up", for: .normal)
        btn.layer.borderWidth = 1.5
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        let buttonContainer = UIView()
        buttonContainer.translatesAutoresizingMaskIntoConstraints = false
        buttonContainer.addSubview(signInButton)
        buttonContainer.addSubview(signUpButton)
        buttonContainer.addContraintsWithFormat(format: "H:|[v0(120)]", views: signInButton)
         buttonContainer.addContraintsWithFormat(format: "H:[v0(120)]|", views: signUpButton)
        buttonContainer.addContraintsWithFormat(format: "V:|[v0]|", views: signInButton)
        buttonContainer.addContraintsWithFormat(format: "V:|[v0]|", views: signUpButton)
        
        let stackView = UIView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addSubview(label)
        stackView.addSubview(emailTextField)
        stackView.addSubview(passwordTextField)
        stackView.addSubview(buttonContainer)
        
        stackView.addContraintsWithFormat(format: "H:|[v0]|", views: label)
        stackView.addContraintsWithFormat(format: "H:|-15-[v0]-15-|", views: emailTextField)
        stackView.addContraintsWithFormat(format: "H:|-15-[v0]-15-|", views: passwordTextField)
        stackView.addContraintsWithFormat(format: "H:|-15-[v0]-15-|", views: buttonContainer)
        stackView.addContraintsWithFormat(format: "V:|[v0]-5-[v1(40)]-20-[v2(40)]-10-[v3]|", views: label,emailTextField,passwordTextField,buttonContainer)
        
        self.addSubview(stackView)
        
        self.addContraintsWithFormat(format: "H:|-10-[v0]-10-|", views: stackView)
        self.addContraintsWithFormat(format: "V:|-10-[v0]-10-|", views: stackView)
    }
}

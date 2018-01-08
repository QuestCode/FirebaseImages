//
//  ModalViewController.swift
//  FirebaseImages
//
//  Created by Devontae Reid on 1/7/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    let blurView: UIVisualEffectView = {
        let bView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        bView.translatesAutoresizingMaskIntoConstraints = false
        return bView
    }()
    
    let dimissButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(dismissModal(_:)), for: .touchUpInside)
        return btn
    }()
    
    let signupView: UIView = {
        let view = DevView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        self.view.isOpaque = false
        
        self.view.addSubview(blurView)
        self.view.addContraintsWithFormat(format: "H:|[v0]|", views: blurView)
        self.view.addContraintsWithFormat(format: "V:|[v0]|", views: blurView)
        
        self.view.addSubview(dimissButton)
        self.view.addContraintsWithFormat(format: "H:|[v0]|", views: dimissButton)
        self.view.addContraintsWithFormat(format: "V:|[v0]|", views: dimissButton)
        
        self.view.addSubview(signupView)
        self.view.addContraintsWithFormat(format: "V:|-200-[v0(250)]", views: signupView)
        self.view.addContraintsWithFormat(format: "H:|-30-[v0]-30-|", views: signupView)
        
        let todos = Todo.loadTodos()
        for todo in todos! {
            print(todo)
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dismissModal(_: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}

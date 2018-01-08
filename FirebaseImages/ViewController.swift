//
//  ViewController.swift
//  FirebaseImages
//
//  Created by Devontae Reid on 1/6/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: "office-notes-notepad-entrepreneur")
        return imgView
    }()
    
    let modalButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Modal Popup", for: .normal)
        btn.layer.borderWidth = 1.5
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(showModal(_:)), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        Todo.loadTodos()
        
        self.view.addSubview(backgroundImageView)
        self.view.addContraintsWithFormat(format: "H:|[v0]|", views: backgroundImageView)
        self.view.addContraintsWithFormat(format: "V:|[v0]|", views: backgroundImageView)
        
        self.view.addSubview(modalButton)
        self.view.addContraintsWithFormat(format: "H:|-15-[v0]-15-|", views: modalButton)
        self.view.addContraintsWithFormat(format: "V:[v0(50)]-20-|", views: modalButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func showModal(_: UIButton) {
        let mdlVC = ModalViewController()
        mdlVC.modalPresentationStyle = .overCurrentContext
        self.present(mdlVC, animated: true, completion: nil)
    }

}

extension UIView {
    func addContraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String:UIView]()
        for (index,view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

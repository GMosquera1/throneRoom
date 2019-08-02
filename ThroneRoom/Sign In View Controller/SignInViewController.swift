//
//  SignInViewController.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/18/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    var signInView = SignInView()
    let authService = AppDelegate.authservice
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(signInView)
        accountButtons()
        view.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)

    }
    func accountButtons() {
        signInView.createAccountButton.addTarget(self, action: #selector(createAccountButton), for: .touchUpInside)
        signInView.signInButton.addTarget(self, action: #selector(signInExistingButton), for: .touchUpInside)
    }
    @objc func createAccountButton(){
        let createAccountViewController = CreateAccountViewController()
        self.navigationController?.pushViewController(createAccountViewController, animated: true)
    }
    @objc func signInExistingButton() {
        let signInExistingView = SignInExistingViewController()
        self.navigationController?.pushViewController(signInExistingView, animated: true)
    }
}

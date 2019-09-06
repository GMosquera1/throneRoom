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
    var homeView = HomeView()
    let authService = AppDelegate.authservice
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(signInView)
        accountButtons()
        view.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        signInView.delegate = self
    }
    func accountButtons() {
//        signInView.createAccountButton.addTarget(self, action: #selector(createAccountButton), for: .touchUpInside)
//        signInView.signInButton.addTarget(self, action: #selector(signInExistingButton), for: .touchUpInside)
//        signInView.createAccountButton.addTarget(self, action: #selector(createAccountButton), for: .touchUpInside)
    }
//    @objc func createAccountButton(){
//    print("I'm creating!")
//
//    }
//    @objc func signInExistingButton() {
//        print("I'm signing in")
//        /// TO-DO log in should redirect to homescreen
//        let homeViewController = HomeViewController()
//        self.navigationController?.pushViewController(homeViewController, animated: true)
//    }
}

extension SignInViewController: SignInViewDelegate {
    func didSelectSignInButton(_ signInView: SignInView, accountLoginState: AccountLoginState) {
        
        let homeViewController = HomeViewController()
        
        self.navigationController?.pushViewController(homeViewController, animated: true)
        
    }
    
    func didSelectCreateAccountButton() {
        let createAccountViewController = CreateAccountViewController()
        
        self.navigationController?.pushViewController(createAccountViewController, animated: true)
        
        
    }
    
    
    
}

//
//  SignInExistingViewController.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 8/2/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import Firebase

protocol signInSuccess {
    func signIn(bool: Bool)
}

class SignInExistingViewController: UIViewController {
    
    var signInExistingView = SignInExistingView()
    var authService = AppDelegate.authservice
    var delegate: signInSuccess?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        existingViewLayout()
    }
    func existingViewLayout() {
        view.addSubview(signInExistingView)
        
        let leftBarItem = UIBarButtonItem(customView: signInExistingView.cancelButton)
        signInExistingView.cancelButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = leftBarItem
        let rightBarItem = UIBarButtonItem(customView: signInExistingView.signInButton)
        signInExistingView.emailLogin.addTarget(self, action: #selector(signInWithCreatedAccount), for: .touchUpInside)
    }
    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
    }
    @objc func signInWithCreatedAccount(){
        guard let emailField = signInExistingView.emailLogin.text,
        let passwordField = signInExistingView.passwordLogin.text
            else {
                showAlert(title: "Error", message: "Error Logging In")
                return
        }
        if emailField.isEmpty && passwordField.isEmpty {
            showAlert(title: "Error", message: "Incorrect Email or Password")
        } else {
            authService.signInExistingAccount(email: emailField, password: passwordField)
        }
    }
}
extension SignInExistingViewController: AuthServiceExistingAccountDelegate {
    func didReceiveErrorSigningToExistingAccount(_ authService: AuthService, error: Error) {
        showAlert(title: "Error", message: error.localizedDescription)
        delegate?.signIn(bool: false)
    }
    
    func didSignInToExistingAccount(_ authService: AuthService, user: User) {
        delegate?.signIn(bool: true)
        if let homeViewController = (parent as? UINavigationController)?.viewControllers.first as? HomeViewController {
            homeViewController.signInView.removeFromSuperview()
            homeViewController.reloadInputViews()
            navigationController?.popViewController(animated: true)
            
        }
        
    }
}

extension SignInExistingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//
//  CreateAccountViewController.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/18/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import Firebase

protocol createdAccount {
    func createdAccount(bool: Bool)
}

class CreateAccountViewController: UIViewController {
   var createView = CreateView()
    var authService = AppDelegate.authservice
    var delegate: createdAccount?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(createView)
        let leftBarItem = UIBarButtonItem(customView: createView.signInButton)
        createView.signInButton.addTarget(self, action: #selector(signInView), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = leftBarItem
        let rightBarItem = UIBarButtonItem(customView: createView.createButton)
        createView.createButton.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = rightBarItem
        authService.authServiceCreateNewAccountDelegate = self
        createView.displayNameTextField.delegate = self
        createView.emailCreatedTextField.delegate = self
        createView.passwordCreatedTextField.delegate = self
        hideKeyboardWhenTappingAround()
    }
    
    @objc func signInView() {
        //navigationController?.popViewController(animated: true)
        let signInViewController = SignInViewController()
        let signInViewControllerNavigation = UINavigationController.init(rootViewController: signInViewController)
       navigationController?.show(signInViewController, sender: self)
    }
    
    @objc func createAccount() {
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        guard let userName = createView.displayNameTextField.text,
        let email = createView.emailCreatedTextField.text, let password = createView.passwordCreatedTextField.text
            else {
                showAlert(title: "Error", message: "Create Account Error")
                return
        }
        if userName.isEmpty || email.isEmpty || password.isEmpty {
            showAlert(title: "Missing Fields", message: "Please fill out all missing fields")
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        } else {
            authService.createNewAccount(username: userName, email: email, password: password)
        }
}
}
extension CreateAccountViewController: AuthServiceCreateNewAccountDelegate {
    func didReceiveErrorCreatingAccount(_ authService: AuthService, error: Error) {
        showAlert(title: "Error", message: error.localizedDescription)
        delegate?.createdAccount(bool: false)
    }
    
    func didCreateNewAccount(_ authService: AuthService, throneRoomUser: UserProfile) {
        delegate?.createdAccount(bool: true)
        if let homeController = (parent as? UINavigationController)?.viewControllers.first
            as? HomeViewController {
            homeController.signInView.removeFromSuperview()
            homeController.reloadInputViews()
            navigationController?.popViewController(animated: true)
           
            
        }
    }
}
extension CreateAccountViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true 
    }
}

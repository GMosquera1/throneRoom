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
        let leftBarItem = UIBarButtonItem(customView: createView.cancelButton)
        createView.cancelButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = leftBarItem
        let rightBarItem = UIBarButtonItem(customView: createView.createButton)
        createView.createButton.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = rightBarItem
//        authService.authServiceCreateNewAccountDelegate = self
//        createView.displayName.delegate = self
//        createView.emailCreatedWith.delegate = self
//        createView.passwordCreatedWith.delegate = self
        
    }
    
    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func createAccount() {
 
}

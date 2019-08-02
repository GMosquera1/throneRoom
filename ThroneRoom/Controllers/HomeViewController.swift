//
//  MainViewController.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/16/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    var signInViewController = SignInViewController()
    var signInView = SignInView()
    var createAccountViewController = CreateAccountViewController()
    var createAccountView = CreateView()
    var signExistingViewController = SignInExistingViewController()
    var signExistingView = SignInExistingView()


    override func viewDidLoad() {
        super.viewDidLoad()
        super.view = homeView
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.907350719, blue: 0.8769339919, alpha: 1)
    }
    
}

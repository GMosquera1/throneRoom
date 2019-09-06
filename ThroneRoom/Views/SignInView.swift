//
//  SignInView.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/18/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

enum AccountLoginState {
    case existingAccount
    case newAccount
}
protocol SignInViewDelegate: AnyObject {
    func didSelectSignInButton(_ signInView: SignInView, accountLoginState: AccountLoginState)
    
    func didSelectCreateAccountButton()
}

class SignInView: UIView {
    
    var scrollViewSignInScreen: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private var logo: UILabel = {
        let label = UILabel()
        label.text = " T H R O N E   R O O M "
        label.font = UIFont(name: "futura", size: 30)
        label.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    private var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        textfield.placeholder = "   Enter Email Address"
        textfield.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        //textfield.layer.cornerRadius = 5
        return textfield
    }()
    
    private var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        textfield.placeholder = "   Enter Password"
        textfield.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        textfield.isSecureTextEntry = true 
        // textfield.layer.cornerRadius = 5
        return textfield
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), for: .normal)
        button.isEnabled = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), for: .normal)
        button.isEnabled = true
        button.layer.cornerRadius = 10
        return button
    }()

    lazy var accountContainerView: UIStackView = {
        let accountView = UIStackView(arrangedSubviews: [ emailTextField, passwordTextField])
        accountView.axis = .vertical
        accountView.distribution = .fillEqually
        accountView.spacing = 2
        accountView.layer.masksToBounds = true
        accountView.layer.cornerRadius = 10
        return accountView
    }()
    
    private var accountLoginState = AccountLoginState.newAccount
    
    public weak var delegate: SignInViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        addSubview(scrollViewSignInScreen)
        
        scrollViewSignInScreen.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([scrollViewSignInScreen.topAnchor.constraint(equalTo: topAnchor), scrollViewSignInScreen.leadingAnchor.constraint(equalTo: leadingAnchor), scrollViewSignInScreen.trailingAnchor.constraint(equalTo: trailingAnchor), scrollViewSignInScreen.bottomAnchor.constraint(equalTo: bottomAnchor)])
        setupView()
        accountButtons()
    }
    private func setupView() {
        
        scrollViewSignInScreen.addSubview(logo)
        
        scrollViewSignInScreen.addSubview(accountContainerView)
        scrollViewSignInScreen.addSubview(signInButton)
        
        scrollViewSignInScreen.addSubview(createAccountButton)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([logo.topAnchor.constraint(equalToSystemSpacingBelow: scrollViewSignInScreen.topAnchor, multiplier: 0.5), logo.centerXAnchor.constraint(equalTo: scrollViewSignInScreen.centerXAnchor), logo.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1), logo.widthAnchor.constraint(equalTo: scrollViewSignInScreen.widthAnchor)])
        
        accountContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([accountContainerView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 100), accountContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25), accountContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25), accountContainerView.heightAnchor.constraint(equalToConstant: 100)])
        
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([createAccountButton.topAnchor.constraint(equalTo: accountContainerView.bottomAnchor, constant: 75), createAccountButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100), createAccountButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)])
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([signInButton.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: 10), signInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100), signInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)])

    }
    
    func accountButtons() {
        
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        
        createAccountButton.addTarget(self, action: #selector(createAccountButtonPressed), for: .touchUpInside)
    }
    @objc func signInButtonPressed() {
        print("I'm signing in")
        
        
        delegate?.didSelectSignInButton(self, accountLoginState: accountLoginState)
        
        
        /// TO-DO log in should redirect to homescreen
        
        //
        //
        
        
        
        
        
    }
    
    @objc func createAccountButtonPressed() {
        print("I am creating an account")
        delegate?.didSelectCreateAccountButton()
        
        
    }
    
    
}


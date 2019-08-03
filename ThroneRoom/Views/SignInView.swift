//
//  SignInView.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/18/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import SnapKit

enum AccountLoginState {
    case existingAccount
    case newAccount
}
protocol SignInViewDelegate: AnyObject {
    func didSelectSignInButton(_ signInView: SignInView, accountLoginState: AccountLoginState )
}

class SignInView: UIView {
    
    private var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8598231673, green: 0.75836128, blue: 0.7784464359, alpha: 1)
        return view
    }()
    
    private var logo: UILabel = {
        let label = UILabel()
        label.text = " T H R O N E  R O O M "
        label.font = UIFont(name: "futura", size: 24)
        label.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return label
    }()
    
    private var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textfield.placeholder = "   Please Enter A Valid Email Address"
        textfield.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        textfield.layer.cornerRadius = 5
        return textfield
    }()
    
    private var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textfield.placeholder = "   Please Enter A Strong Password"
        textfield.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        textfield.layer.cornerRadius = 5
        return textfield
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), for: .normal)
        button.isEnabled = true
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var createAccountButton: UIButton = {
        //private var only works within it's intended class
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), for: .normal)
        button.isEnabled = true
        button.layer.cornerRadius = 5
        return button
    }()
    
    
    private var accountUpdateLabel: UILabel = {
        let label = UILabel()
        label.text = "If you already have an account, please sign in"
        label.font = UIFont(name: "futura", size: 14)
        label.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return label
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
        setupViews()
    }
    private func setupViews() {
        addSubview(contentView)
      addSubview(logo)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(createAccountButton)
        addSubview(accountUpdateLabel)
        addSubview(signInButton)
        
        contentView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        logo.snp.makeConstraints { (make) in
            make.top.equalTo(95)
            make.left.equalTo(60)
            make.right.equalTo(-60)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(logo.snp_bottom).offset(50)
            make.left.equalTo(50)
            make.right.equalTo(-50)
      
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom).offset(40)
            make.left.equalTo(50)
            make.right.equalTo(-50)
        }
        
        createAccountButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(40)
            make.left.equalTo(100)
            make.right.equalTo(-100)
        }
        
        accountUpdateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(createAccountButton.snp_bottom).offset(190)
            make.left.equalTo(40)
            make.right.equalTo(-40)
        }
        signInButton.snp.makeConstraints { (make) in
            make.top.equalTo(accountUpdateLabel.snp.bottom).offset(30)
            make.left.equalTo(100)
            make.right.equalTo(-100)
        }
    }
    
    
    
    
}


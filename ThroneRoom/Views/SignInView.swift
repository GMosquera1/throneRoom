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
        label.text = " G R O U P  N A M E "
        label.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return label
    }()
    
    private var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Please Enter A Valid Email"
        textfield.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return textfield
    }()
    
    private var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Please Enter A Strong Password"
        textfield.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return textfield
    }()
    
    private var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        return button
    }()
    
    private var accountUpdateLabel: UILabel = {
        let label = UILabel()
        label.text = "If you already have an account, please sign in."
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
        addSubview(signInButton)
        addSubview(accountUpdateLabel)
        
        contentView.snp.makeConstraints { (make) in
                make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
      
        
        logo.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(logo.snp.bottom).offset(5)
            make.left.equalTo(2)
            make.right.equalTo(-20)
        }
        
passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(2)
            make.right.equalTo(-20)
        }
    }
    
    
    
}


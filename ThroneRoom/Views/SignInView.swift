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
    func didSelectSignInButton(_ signInView: SignInView, accountLoginState: AccountLoginState )
}

class SignInView: UIView {
    
    private var contentView: UIView = {
       let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        return view
    }()
    
    private var logo: UILabel = {
        let label = UILabel()
        label.text = " C O N N E C T  G R O U P"
        label.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return label
    }()
    
    private var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Please Enter A Valid Email"
        return textfield
    }()
    
    private var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Please Enter A Strong Password"
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
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.addSubview(logo)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([logo.topAnchor.constraint(equalTo: topAnchor, constant: 10),logo.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75), logo.centerXAnchor.constraint(equalTo: self.centerXAnchor), logo.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
      
        
    }
    
    
    
}


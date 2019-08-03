//
//  SignInExistingView.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 8/2/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import SnapKit

class SignInExistingView: UIView {
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    private var logo: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.text = "T H R O N E  R O O M"
        label.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        label.font = UIFont(name: "Futura", size: 30)
        label.textAlignment = .center
        return label
    }()
    
    var emailLogin: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        textfield.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        textfield.placeholder = "Enter Email"
        return textfield
    }()
    
    var passwordLogin: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        textfield.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        textfield.placeholder = "Enter Password"
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    lazy var textFieldContainerVew: UIView = {
        let tfv = UIView()
        tfv.layer.cornerRadius = 10
        tfv.layer.masksToBounds = true
        tfv.backgroundColor = .clear
        return tfv
    }()
    
    lazy var cancelButton: UIButton = {
        var button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.isEnabled = true
        return button
    }()
    
    lazy var signInButton: UIButton = {
        var button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), for: .normal)
        button.isEnabled = true
        return button
    }()
    
    private func commonInit(){
        logoLabelConstraints()
        setUpViews()
        addSubview(cancelButton)
        addSubview(signInButton)
    }
    
    private func setUpViews() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.addSubview(textFieldContainerVew)
        
        textFieldContainerVew.addSubview(emailLogin)
        textFieldContainerVew.addSubview(passwordLogin)
        textFieldContainerVew.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(375)
            make.height.equalTo(100)
            
        }
        
        emailLogin.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        
        passwordLogin.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(emailLogin.snp_bottom).offset(2)
            make.bottom.equalTo(textFieldContainerVew.snp.bottom)
        }
    }
    
    private func logoLabelConstraints(){
        addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        logo.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.7).isActive = true
        logo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        logo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
}

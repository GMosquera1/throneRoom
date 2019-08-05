//
//  CreateView.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/18/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import SnapKit

class CreateView: UIView {
    
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
        label.backgroundColor = .clear
        label.text = "T H R O N E  R O O M"
        label.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        label.font = UIFont(name: "Futura", size: 30)
        label.textAlignment = .center
        return label
    }()
    
    var emailCreatedTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        textfield.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        textfield.placeholder = "  Enter Email"
        return textfield
    }()
    
    var passwordCreatedTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        textfield.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        textfield.placeholder = "  Enter Password"
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    var displayNameTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        textfield.textColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        //TODO: find out how to align (Indent) text
        textfield.placeholder = "  Display Name"
       // textfield.textAlignment
        return textfield
    }()
    
    lazy var signInButton: UIButton = {
        var button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), for: .normal)
        button.isEnabled = true
        button.backgroundColor = #colorLiteral(red: 1, green: 0.8934749961, blue: 0.8764544129, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var createButton: UIButton = {
        var button = UIButton()
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.8934749961, blue: 0.8764544129, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.isEnabled = true
        return button
    }()
    
    lazy var stackViewContainer: UIView = {
        let vc = UIView()
        vc.layer.cornerRadius = 10
        vc.layer.masksToBounds = true
        vc.backgroundColor = .clear
        return vc
    }()
    
    lazy var accountContainerView: UIStackView = {
        let accountView = UIStackView(arrangedSubviews: [displayNameTextField, emailCreatedTextField, passwordCreatedTextField])
        accountView.axis = .vertical
        accountView.distribution = .fillEqually
        accountView.spacing = 2
        accountView.layer.masksToBounds = true
        accountView.layer.cornerRadius = 10
        return accountView
    }()
    private func commonInit(){
        addSubview(signInButton)
        addSubview(createButton)
        addSubview(displayNameTextField)
        addSubview(accountContainerView)
        setUpView()
    }
    
    private func setUpView() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.addSubview(logo)
        self.addSubview(stackViewContainer)
        stackViewContainer.addSubview(accountContainerView)
        logo.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY).offset(-176)
        }
        stackViewContainer.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(logo.snp.bottom).offset(50)
            make.height.equalTo(150)
        }
        accountContainerView.snp.makeConstraints { (make) in
            make.edges.equalTo(stackViewContainer)
        }
        createButton.snp.makeConstraints { (make) in
            make.left.equalTo(130)
            make.right.equalTo(-130)
            make.top.equalTo(accountContainerView.snp.bottom).offset(60)
            make.height.equalTo(40)
        }
        signInButton.snp.makeConstraints { (make) in
            make.left.equalTo(130)
            make.right.equalTo(-130)
            make.top.equalTo(createButton.snp.bottom).offset(10)
            make.height.equalTo(40)
        }
        
    }
    
}

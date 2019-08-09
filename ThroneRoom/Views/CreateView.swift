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
        label.text = "T H R O N E   R O O M"
        label.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        label.font = UIFont(name: "Futura", size: 30)
        label.textAlignment = .center
        return label
    }()
    
    var throneRoomUserImageButton: UIButton = {
        let userImageButton = UIButton()
        userImageButton.setImage(#imageLiteral(resourceName: "icons8-face-id-32").withRenderingMode(.alwaysOriginal), for: .normal)
        userImageButton.backgroundColor = #colorLiteral(red: 1, green: 0.907350719, blue: 0.8769339919, alpha: 1)
        return userImageButton
    }()
    
    var imageSelectionLabel: UILabel = {
       let label = UILabel()
        label.text = " Please Select Image (optiona)"
        return label
    }()
    
    var emailCreatedTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        textfield.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        textfield.placeholder = "  Enter Email"
        textfield.layer.cornerRadius = 5
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
    
    var fullNameTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        textfield.textColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        //TODO: find out how to align (Indent) text
        textfield.placeholder = "  Full Name"
        // textfield.textAlignment
        return textfield
    }()
    var cityTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        textfield.textColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        textfield.placeholder = "  City/ Country"
        return textfield
    }()
    
    
    //    var cityPicker: UIPickerView = {
    //       let pickerView = UIPickerView()
    //
    //        return pickerView
    //    }()
    
    //    lazy var signInButton: UIButton = {
    //        var button = UIButton()
    //        button.setTitle("Sign In", for: .normal)
    //        button.setTitleColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), for: .normal)
    //        button.isEnabled = true
    //        button.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
    //        button.layer.masksToBounds = true
    //        button.layer.cornerRadius = 10
    //        return button
    //    }()
    
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
        let accountView = UIStackView(arrangedSubviews: [displayNameTextField, fullNameTextField, cityTextField, emailCreatedTextField, passwordCreatedTextField])
        accountView.axis = .vertical
        accountView.distribution = .fillEqually
        accountView.spacing = 2
        accountView.layer.masksToBounds = true
        accountView.layer.cornerRadius = 10
        return accountView
    }()
    private func commonInit(){
        addSubview(createButton)
        addSubview(displayNameTextField)
        addSubview(accountContainerView)
        setUpView()
    }
    
    private func setUpView() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.addSubview(logo)
        self.addSubview(throneRoomUserImageButton)
        self.addSubview(imageSelectionLabel)
        self.addSubview(stackViewContainer)
        stackViewContainer.addSubview(accountContainerView)
        logo.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY).offset(-300)
        }
        
        throneRoomUserImageButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(logo.snp.centerX)
          //  make.centerY.equalTo(self.snp.centerY).offset(-100)
            make.top.equalTo(logo.snp.bottom).offset(25)
            make.height.equalTo(150)
            make.width.equalTo(150)
        }
        imageSelectionLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(throneRoomUserImageButton.snp.centerX).offset(10)
            //make.centerY.equalTo(throneRoomUserImageButton.snp.centerY).offset(-10)
            make.top.equalTo(throneRoomUserImageButton.snp.bottom).offset(10)
            
        }
        stackViewContainer.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(imageSelectionLabel.snp.bottom).offset(10)
            make.height.equalTo(250)
        }
        accountContainerView.snp.makeConstraints { (make) in
            make.edges.equalTo(stackViewContainer)
        }
        createButton.snp.makeConstraints { (make) in
            make.left.equalTo(130)
            make.right.equalTo(-130)
            make.top.equalTo(accountContainerView.snp.bottom).offset(40)
            make.height.equalTo(40)
        }
        
    }
    
}

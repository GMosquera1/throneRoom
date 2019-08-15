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
    

    
    var scrollViewScreen: UIScrollView = {
        let scrollView = UIScrollView()
        //scrollView.isScrollEnabled = true
       // scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .red
        //scrollView.bounces = true
        //scrollView.alwaysBounceVertical = true
        //scrollView.isScrollEnabled = true
        //scrollView.delaysContentTouches = false
        //scrollView.contentSize.height = 2000
        return scrollView
    }()
    
    private var logo: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "T H R O N E   R O O M"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Futura", size: 30)
        label.textAlignment = .center
        return label
    }()
    
    var imagePickerController: UIImagePickerController = {
        let pickerController = UIImagePickerController()
        //pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.mediaTypes = ["public.image", "public.movie"]
        pickerController.sourceType = .photoLibrary
        return pickerController
    }()
    
    
    
    var throneRoomUserImage: UIImageView = {
        let userImage = UIImageView()
        userImage.image = #imageLiteral(resourceName: "versePlaceHolder")
        userImage.backgroundColor = #colorLiteral(red: 1, green: 0.907350719, blue: 0.8769339919, alpha: 1)
        return userImage
    }()
    
    var imageSelectCameraButton: UIButton = {
        var button = UIButton()
        button.setImage(#imageLiteral(resourceName: "icons8-camera-32"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.8934749961, blue: 0.8764544129, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.isEnabled = true
        return button
    }()
    var imageSelectLibraryButton: UIButton = {
        var button = UIButton()
        button.setImage(#imageLiteral(resourceName: "icons8-camera-32"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.8934749961, blue: 0.8764544129, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.isEnabled = true
        return button
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
    lazy var createAccountContainerView: UIView = {
        let createContainerView = UIView()
        createContainerView.layer.cornerRadius = 10
        createContainerView.layer.masksToBounds = true
        createContainerView.backgroundColor = .clear
        createContainerView.isUserInteractionEnabled = true
        createContainerView.translatesAutoresizingMaskIntoConstraints = false 
        return createContainerView
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
        addSubview(scrollViewScreen)
        scrollViewScreen.translatesAutoresizingMaskIntoConstraints = false
        scrollViewScreen.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollViewScreen.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollViewScreen.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollViewScreen.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
      // addSubview(scrollViewScreen)
//        addSubview(createButton)
//        addSubview(displayNameTextField)
//        addSubview(accountContainerView)
       setUpView()
    }
    
    
    
    private func setUpView() {
    
        scrollViewScreen.addSubview(logo)
        scrollViewScreen.addSubview(throneRoomUserImage)
        scrollViewScreen.addSubview(imageSelectCameraButton)
        scrollViewScreen.addSubview(imageSelectLibraryButton)
        //scrollViewScreen.addSubview(stackViewContainer)
        
       //stackViewContainer.addSubview(accountContainerView)
   //     stackViewContainer.addSubview(accountContainerView)
//        logo.translatesAutoresizingMaskIntoConstraints = false
//        logo.topAnchor.constraint(equalToSystemSpacingBelow: scrollViewScreen.topAnchor, multiplier: 0.5).isActive = true
//        logo.centerXAnchor.constraint(equalTo: scrollViewScreen.centerXAnchor).isActive = true
//        logo.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
//        logo.widthAnchor.constraint(equalTo: scrollViewScreen.widthAnchor, multiplier: 0.5).isActive = true
//                scrollViewScreen.addSubview(throneRoomUserImage)
//        scrollViewScreen.addSubview(imageSelectCameraButton)
//                scrollViewScreen.addSubview(accountContainerView)
//                scrollViewScreen.addSubview(stackViewContainer)
//        self.addSubview(logo)
//        self.addSubview(throneRoomUserImage)
//        self.addSubview(imageSelectCameraButton)
//        self.addSubview(imageSelectLibraryButton)
//        self.addSubview(stackViewContainer)
//        stackViewContainer.addSubview(accountContainerView)
        
//        scrollViewScreen.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self.snp.centerX)
//            make.centerY.equalTo(self.snp.centerY)
//        }
        logo.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY).offset(-300)
        }
        
        throneRoomUserImage.snp.makeConstraints { (make) in
            make.centerX.equalTo(logo.snp.centerX)
            //  make.centerY.equalTo(self.snp.centerY).offset(-100)
            make.top.equalTo(logo.snp.bottom).offset(25)
            make.height.equalTo(150)
            make.width.equalTo(150)
        }
        imageSelectLibraryButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(throneRoomUserImage.snp.centerX).offset(20)
            //make.centerY.equalTo(throneRoomUserImageButton.snp.centerY).offset(-10)
            make.top.equalTo(throneRoomUserImage.snp.bottom).offset(10)

        }
        imageSelectCameraButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(throneRoomUserImage.snp.centerX).offset(-20)
            //make.centerY.equalTo(throneRoomUserImageButton.snp.centerY).offset(-10)
            make.top.equalTo(throneRoomUserImage.snp.bottom).offset(10)

        }
//        stackViewContainer.snp.makeConstraints { (make) in
//            make.left.equalTo(10)
//            make.right.equalTo(-100)
//            make.top.equalTo(imageSelectLibraryButton.snp.bottom).offset(10)
//            make.height.equalTo(200)
//        }
//        accountContainerView.snp.makeConstraints { (make) in
//            make.edges.equalTo(stackViewContainer)
//        }
//        createButton.snp.makeConstraints { (make) in
//            make.left.equalTo(130)
//            make.right.equalTo(-130)
//            make.top.equalTo(accountContainerView.snp.bottom).offset(40)
//            make.height.equalTo(40)
//        }
        
    }
    
}

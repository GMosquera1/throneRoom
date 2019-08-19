//
//  CreateView.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/18/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class CreateView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        throneRoomUserImage.contentMode = .scaleAspectFill
        throneRoomUserImage.layer.cornerRadius = throneRoomUserImage.frame.size.width / 2
        throneRoomUserImage.layer.masksToBounds = false
        throneRoomUserImage.layer.borderColor = #colorLiteral(red: 1, green: 0.7713925838, blue: 0.8318699598, alpha: 1)
        throneRoomUserImage.layer.borderWidth = 3
        throneRoomUserImage.clipsToBounds = true
    }
    
    
    var scrollViewScreen: UIScrollView = {
        let scrollView = UIScrollView()
        //scrollView.isScrollEnabled = true
        // scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
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
        label.textColor = .black
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
        button.setImage(#imageLiteral(resourceName: "icons8-literature-32"), for: .normal)
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
    
    lazy var buttonStackView: UIStackView = {
        let buttonView = UIStackView(arrangedSubviews: [imageSelectCameraButton, imageSelectLibraryButton])
        buttonView.axis = .horizontal
        buttonView.distribution = .fillEqually
        //buttonView.spacing = 2
        buttonView.layer.masksToBounds = true
        buttonView.layer.cornerRadius = 10
        return buttonView
    }()
    private func commonInit(){
        addSubview(scrollViewScreen)
        scrollViewScreen.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([scrollViewScreen.topAnchor.constraint(equalTo: topAnchor), scrollViewScreen.leadingAnchor.constraint(equalTo: leadingAnchor), scrollViewScreen.trailingAnchor.constraint(equalTo: trailingAnchor), scrollViewScreen.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
        setUpView()
    }
    
    
    
    private func setUpView() {
        
        scrollViewScreen.addSubview(logo)
        scrollViewScreen.addSubview(throneRoomUserImage)
        scrollViewScreen.addSubview(imageSelectCameraButton)
        scrollViewScreen.addSubview(imageSelectLibraryButton)
        scrollViewScreen.addSubview(stackViewContainer)
        scrollViewScreen.addSubview(createButton)
        scrollViewScreen.addSubview(buttonStackView)
        
        stackViewContainer.addSubview(accountContainerView)
        
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([ logo.topAnchor.constraint(equalToSystemSpacingBelow: scrollViewScreen.topAnchor, multiplier: 0.5),
                                      logo.centerXAnchor.constraint(equalTo: scrollViewScreen.centerXAnchor),
                                      logo.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
                                      logo.widthAnchor.constraint(equalTo: scrollViewScreen.widthAnchor)])
        throneRoomUserImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([throneRoomUserImage.topAnchor.constraint(equalToSystemSpacingBelow: logo.bottomAnchor, multiplier: 0.4), throneRoomUserImage.centerXAnchor.constraint(equalTo: scrollViewScreen.centerXAnchor), throneRoomUserImage.heightAnchor.constraint(equalTo: throneRoomUserImage.widthAnchor), throneRoomUserImage.widthAnchor.constraint(equalTo: scrollViewScreen.widthAnchor, multiplier: 0.5)])
        
        imageSelectLibraryButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageSelectLibraryButton.topAnchor.constraint(equalTo: throneRoomUserImage.bottomAnchor), imageSelectLibraryButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ])

        imageSelectCameraButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageSelectCameraButton.topAnchor.constraint(equalTo: throneRoomUserImage.bottomAnchor), imageSelectCameraButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
            ])
        
        //imageSelectCameraButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40)
        stackViewContainer.translatesAutoresizingMaskIntoConstraints = false
        //stackViewContainer.topAnchor.constraint(equalTo: imageSelectLibraryButton.bottomAnchor, constant: 5)
        NSLayoutConstraint.activate([stackViewContainer.topAnchor.constraint(equalTo: imageSelectLibraryButton.bottomAnchor, constant: 5),stackViewContainer.heightAnchor.constraint(equalTo: scrollViewScreen.heightAnchor, multiplier: 0.75), stackViewContainer.widthAnchor.constraint(equalTo: scrollViewScreen.widthAnchor, multiplier: 0.90), stackViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor), stackViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor)])
//        stackViewContainer.snp.makeConstraints { (make) in
//            make.left.equalTo(10)
//            make.right.equalTo(-100)
//            make.top.equalTo(imageSelectLibraryButton.snp.bottom).offset(10)
//            make.height.equalTo(200)
//        }
      
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([buttonStackView.topAnchor.constraint(equalTo: throneRoomUserImage.bottomAnchor, constant: 150), buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100) ])
        accountContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([accountContainerView.centerXAnchor.constraint(equalTo: stackViewContainer.centerXAnchor), accountContainerView.centerYAnchor.constraint(equalTo: stackViewContainer.centerYAnchor)])
        
        createButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([createButton.topAnchor.constraint(equalTo: stackViewContainer.bottomAnchor), createButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10), createButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)])
        
    }
    
}

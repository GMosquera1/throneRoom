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
        //throneRoomUserImage.layer.borderColor = #colorLiteral(red: 1, green: 0.7713925838, blue: 0.8318699598, alpha: 1)
        //throneRoomUserImage.layer.borderWidth = 3
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
        button.backgroundColor = #colorLiteral(red: 0.9983372092, green: 0.775170505, blue: 0.8276844621, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.isEnabled = true
        return button
    }()
    var imageSelectLibraryButton: UIButton = {
        var button = UIButton()
        button.setImage(#imageLiteral(resourceName: "icons8-literature-32"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9996258616, green: 0.7667750716, blue: 0.8282625079, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.isEnabled = true
        return button
    }()
    lazy var buttonStackView: UIStackView = {
        let buttonView = UIStackView(arrangedSubviews: [imageSelectCameraButton, imageSelectLibraryButton])
        buttonView.axis = .horizontal
        buttonView.distribution = .fillEqually
        buttonView.spacing = 4
        buttonView.layer.masksToBounds = true
        buttonView.layer.cornerRadius = 10
        return buttonView
    }()
    var displayNameTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        textfield.textColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        //TODO: find out how to align (Indent) text
        textfield.placeholder = "  Display Name"
        // textfield.textAlignment
        textfield.layer.cornerRadius = 5
        return textfield
    }()
    var fullNameTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        textfield.textColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        //TODO: find out how to align (Indent) text
        textfield.placeholder = "  Full Name"
        // textfield.textAlignment
        textfield.layer.cornerRadius = 5
        return textfield
    }()
    var cityTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        textfield.textColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        textfield.placeholder = "  City/ Country"
        textfield.layer.cornerRadius = 5
        return textfield
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
        textfield.layer.cornerRadius = 5
        return textfield
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
    
    lazy var createButton: UIButton = {
        var button = UIButton()
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9787860513, green: 0.7553177476, blue: 0.8252794743, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.isEnabled = true
        return button
    }()
    
    
    func createdAccount() {
        
        
    }
    
    private func commonInit(){
        addSubview(scrollViewScreen)
        scrollViewScreen.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([scrollViewScreen.topAnchor.constraint(equalTo: topAnchor), scrollViewScreen.leadingAnchor.constraint(equalTo: leadingAnchor), scrollViewScreen.trailingAnchor.constraint(equalTo: trailingAnchor), scrollViewScreen.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
        setUpView()
    }
    
    
    
    private func setUpView() {
        
        scrollViewScreen.addSubview(logo)
        scrollViewScreen.addSubview(throneRoomUserImage)
        scrollViewScreen.addSubview(buttonStackView)
        scrollViewScreen.addSubview(accountContainerView)
        scrollViewScreen.addSubview(createButton)
        
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([ logo.topAnchor.constraint(equalToSystemSpacingBelow: scrollViewScreen.topAnchor, multiplier: 0.5),
                                      logo.centerXAnchor.constraint(equalTo: scrollViewScreen.centerXAnchor),
                                      logo.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
                                      logo.widthAnchor.constraint(equalTo: scrollViewScreen.widthAnchor)])
        throneRoomUserImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([throneRoomUserImage.topAnchor.constraint(equalToSystemSpacingBelow: logo.bottomAnchor, multiplier: 0.4), throneRoomUserImage.centerXAnchor.constraint(equalTo: scrollViewScreen.centerXAnchor), throneRoomUserImage.heightAnchor.constraint(equalTo: throneRoomUserImage.widthAnchor), throneRoomUserImage.widthAnchor.constraint(equalTo: scrollViewScreen.widthAnchor, multiplier: 0.5)])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([buttonStackView.topAnchor.constraint(equalTo: throneRoomUserImage.bottomAnchor, constant: 15), buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100) ])
        accountContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([accountContainerView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 25), accountContainerView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25), accountContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25), accountContainerView.heightAnchor.constraint(equalToConstant: 250)])
        createButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([createButton.topAnchor.constraint(equalTo: accountContainerView.bottomAnchor, constant: 25), createButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100), createButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)])
        
    }
    
}

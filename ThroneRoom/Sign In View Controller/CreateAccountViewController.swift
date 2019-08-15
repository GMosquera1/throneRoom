//
//  CreateAccountViewController.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/18/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import Firebase
import Toucan

protocol createdAccount {
    func createdAccount(bool: Bool)
}

class CreateAccountViewController: UIViewController {
    var createView = CreateView()
    var authService = AppDelegate.authservice
    var delegate: createdAccount?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(createView)
        createView.createButton.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
        createView.imageSelectLibraryButton.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
        createView.imageSelectCameraButton.addTarget(self, action: #selector(takePhoto), for: .touchUpInside)
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        authService.authServiceCreateNewAccountDelegate = self
//        createView.scrollViewScreen.contentSize = CGSize(width: screenWidth , height: screenHeight)
        createView.displayNameTextField.delegate = self
        createView.emailCreatedTextField.delegate = self
        createView.passwordCreatedTextField.delegate = self
        createView.cityTextField.delegate = self
        hideKeyboardWhenTappingAround()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        createView.scrollViewScreen.contentSize.height = 2000
    }
    
    @objc func signInView() {
        print("I sign in")
        //navigationController?.popViewController(animated: true)
        let signInViewController = SignInViewController()
        
        let signInViewControllerNavigation = UINavigationController.init(rootViewController: signInViewController)
        
        //present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        navigationController?.show(signInViewController, sender: self)
    }
    
    @objc func createAccount() {
        print("I create")
        //self.createView.createButton.isEnabled = true 
        guard let displayName = createView.displayNameTextField.text,
            let fullName = createView.fullNameTextField.text,
            let email = createView.emailCreatedTextField.text, let password = createView.passwordCreatedTextField.text, let city = createView.cityTextField.text, let photoURL = URL(string: "www.lovely.com")
            else {
                showAlert(title: "Error", message: "Create Account Error")
                return
        }
        if displayName.isEmpty || fullName.isEmpty || email.isEmpty || password.isEmpty || city.isEmpty  {
            showAlert(title: "Missing Fields", message: "Please fill out all missing fields")
            self.createView.createButton.isEnabled = false
        } else {
            authService.createNewAccount(throneUserName: displayName, fullName: fullName, city: city, email: email, password: password, photoURL: photoURL)
        }
    }
    
    @objc func selectImage() {
        print("image selected")
    }
    
    @objc func takePhoto() {
        print("access camera")
    }
}
extension CreateAccountViewController: AuthServiceCreateNewAccountDelegate {
    func didReceiveErrorCreatingAccount(_ authService: AuthService, error: Error) {
        showAlert(title: "Error", message: error.localizedDescription)
        delegate?.createdAccount(bool: false)
    }
    
    func didCreateNewAccount(_ authService: AuthService, throneRoomUser: UserProfile) {
        delegate?.createdAccount(bool: true)
        if let homeController = (parent as? UINavigationController)?.viewControllers.first
            as? HomeViewController {
            homeController.signInView.removeFromSuperview()
            homeController.reloadInputViews()
            navigationController?.popViewController(animated: true)
            //homeController.
        }
    }
}
extension CreateAccountViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true 
    }
}

extension CreateAccountViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let originalImage = info [UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            print("Original image is nil")
            return
        }
        let resizedImage = Toucan.init(image: originalImage).resize(CGSize(width: 500, height: 500))
        createView.throneRoomUserImage.image = resizedImage.image
        dismiss(animated: true)
    }
}

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
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    private var logo: UILabel = {
        let label = UILabel()
        label.text = " T H R O N E   R O O M "
        label.font = UIFont(name: "futura", size: 30)
        label.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    private var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        textfield.placeholder = "   Enter Email Address"
        textfield.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        //textfield.layer.cornerRadius = 5
        return textfield
    }()
    
    private var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        textfield.placeholder = "   Enter Password"
        textfield.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        textfield.isSecureTextEntry = true 
       // textfield.layer.cornerRadius = 5
        return textfield
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), for: .normal)
        button.isEnabled = true
        button.layer.cornerRadius = 10
        return button
    }()

    lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), for: .normal)
        button.isEnabled = true
        button.layer.cornerRadius = 10
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
        let accountView = UIStackView(arrangedSubviews: [ emailTextField, passwordTextField])
        accountView.axis = .vertical
        accountView.distribution = .fillEqually
        accountView.spacing = 2
        accountView.layer.masksToBounds = true
        accountView.layer.cornerRadius = 10
        return accountView
    }()
    private var tapGesture: UITapGestureRecognizer = {
       let tapGestureRecognizer = UITapGestureRecognizer()
        return tapGestureRecognizer
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
        addSubview(logo)
        addSubview(accountContainerView)
        addSubview(createAccountButton)
        addSubview(signInButton)
        setupViews()
    }
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
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
            make.height.equalTo(99)
        }
        accountContainerView.snp.makeConstraints { (make) in
            make.edges.equalTo(stackViewContainer)
        }
        
        createAccountButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.left.equalTo(120)
            make.right.equalTo(-120)
        }
        signInButton.snp.makeConstraints { (make) in
            make.top.equalTo(createAccountButton.snp.bottom).offset(10)
            make.left.equalTo(120)
            make.right.equalTo(-120)
        }
       
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        
    }
    @objc func signInButtonPressed() {
        print("I'm signing in")
        /// TO-DO log in should redirect to homescreen
//        let homeViewController = HomeViewController()
//        self.navigationController?.pushViewController(homeViewController, animated: true)
        
        delegate?.didSelectSignInButton(self, accountLoginState: accountLoginState)
        let homeViewController = HomeViewController()
        let bibleViewController = BibleViewController()
        let prayerViewController = PrayerViewController()
        let praiseJournalViewController = PraiseJournalViewController()
        
        let tabBar = UITabBarController()
        tabBar.tabBar.barTintColor = UIColor.white
        
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "icons8-home-page-32"), tag: 0)
        let homeViewControllerNavigation = UINavigationController.init(rootViewController: homeViewController)
        
        
        let bibleViewControllerNavigation = UINavigationController.init(rootViewController: bibleViewController)
        bibleViewController.tabBarItem = UITabBarItem(title: "Bible"
            , image: #imageLiteral(resourceName: "icons8-literature-32") , tag: 1)
        
        let prayerViewControllerNavigation = UINavigationController.init(rootViewController: prayerViewController)
        prayerViewController.tabBarItem = UITabBarItem(title: "Prayer", image: #imageLiteral(resourceName: "icons8-pray-32-2"), tag: 2)
        
        let praiseJournalViewControllerNavigation = UINavigationController(rootViewController: praiseJournalViewController)
        praiseJournalViewController.tabBarItem = UITabBarItem(title: "Praise", image: #imageLiteral(resourceName: "icons8-heart-32-2"), tag: 3)
        
        tabBar.viewControllers = [homeViewController, UINavigationController(rootViewController: bibleViewController), UINavigationController(rootViewController: prayerViewController), UINavigationController(rootViewController: praiseJournalViewController) ]
//
//        launchScreenViewController.present(tabBar, animated: true, completion: nil)
//         self.navigationController?.pushViewController(tabBar, animated: true) 
    }
    
    
}


//
//  UIViewController+Navigation.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 8/3/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

extension UIViewController {
    public func showLoginView() {
    }
    public func hideKeyboardWhenTappingAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

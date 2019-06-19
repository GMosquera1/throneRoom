//
//  SignInModel.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/19/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation

struct SignInModel {
    let userId: String?
    let fullName: String?
    let email: String?
    let city: String?
    let state: String?
    let connectGroupName: String?
    
    
    init(userId: String, fullName: String, email: String, city: String, state: String, connectGroupName: String) {
        self.userId = userId
        self.fullName = fullName
        self.email = email
        self.city = city
        self.state = state
        self.connectGroupName = connectGroupName
    }
}

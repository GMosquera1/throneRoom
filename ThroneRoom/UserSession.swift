//
//  UserSession.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 8/19/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

//import Foundation
//import FirebaseAuth
//
//protocol UserSessionAccountCreationDelegate: AnyObject {
//    func didCreateAccount(_ userSession: UserSession, user: User)
//    func didRecieveErrorCreatingAccount(_ userSession: UserSession, error: Error)
//}
//
//protocol UserSessionSignOutDelegate: AnyObject {
//    func didRecieveSignOutError(_ userSession: UserSession, error: Error)
//    func didSignOutUser(_ usersession: UserSession)
//}
//
//protocol UserSessionSignInDelegate: AnyObject {
//    func didRecieveSignInError(_ usersession: UserSession, error: Error)
//    func didSignInExistingUser(_ usersession: UserSession, user: User)
//}
//
//final class UserSession {
//    weak var userSessionAccountDelegate: userSessionAccountDelegate?
//    weak var userSessionSignOutDelegate: UserSessionSignOutDelegate?
//    weak var userSessionSignInDelegate: UserSessionSignInDelegate?
//    
//    public func createNewAccount(email: String, password: String)
//}

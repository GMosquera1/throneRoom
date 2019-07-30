//
//  AuthService.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 7/30/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol AuthServiceCreateNewAccountDelegate: AnyObject {
    func didReceiveErrorCreatingAccount(_ authService: AuthService, error: Error)
    func didCreateNewAccount(_ authService: AuthService, throneRoomUser: UserProfile)
}
protocol AuthServiceExistingAccountDelegate: AnyObject {
    func didReceiveErrorSigningToExistingAccount(_ authService: AuthService, error: Error)
    func didSignInToExistingAccount(_ authService: AuthService, user: User)
}
protocol AuthServiceSignOutDelegate: AnyObject {
    func didSignOutWithError(_ authService: AuthService, error: Error)
    func didSignOut(_ authService: AuthService)
}
final class AuthService {
    weak var authServiceCreateNewAccountDelegate: AuthServiceCreateNewAccountDelegate?
    weak var authServiceExistingAccountDelegate: AuthServiceExistingAccountDelegate?
    weak var authServiceSignOutDelegate: AuthServiceSignOutDelegate?
    public func createNewAccount(username: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            if let error = error {
                self.authServiceCreateNewAccountDelegate?.didReceiveErrorCreatingAccount(self, error: error)
                return
            } else if let authDataResult = authDataResult {
                
                let request = authDataResult.user.createProfileChangeRequest()
                request.displayName = username
                request.commitChanges(completion: { (error) in
                    if let error = error {
                        self.authServiceCreateNewAccountDelegate?.didReceiveErrorCreatingAccount(self, error: error)
                        return
                    }
                })
                let throneRoomUser = UserProfile.init(userId: authDataResult.user.uid,
                                                      fullName: username,
                                                      email: authDataResult.user.email!,
                                                      photoURL: nil,
                                                      joinedDate: Date,
                                                      firstName: nil,
                                                      lastName: nil,
                                                      bio: nil)
                DBService.createThroneRoomUser(user: throneRoomUser, completion: { (error) in
                    if let error = error {
                        self.authserviceCreateNewAccountDelegate?.didRecieveErrorCreatingAccount(self, error: error)
                    } else {
                        self.authserviceCreateNewAccountDelegate?.didCreateNewAccount(self, throneRoomUser: throneRoomUser)
                    }
                })
            }
        }
    }
    
    public func signInExistingAccount(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            if let error = error {self.authServiceExistingAccountDelegate?.didReceiveErrorSigningToExistingAccount(self, error: error)
            } else if let authDataResult = authDataResult {
                self.authServiceExistingAccountDelegate?.didSignInToExistingAccount(self, user: authDataResult.user)
                
            }
        }
    }
    
    public func getCurrentUser() -> User? {
        return Auth.auth().currentUser
    }
    public func signOutAccount() {
        do {
            try Auth.auth().signOut()
            authServiceSignOutDelegate?.didSignOut(self)
        } catch {
            authServiceSignOutDelegate?.didSignOutWithError(self, error: error)
        }
    }
}

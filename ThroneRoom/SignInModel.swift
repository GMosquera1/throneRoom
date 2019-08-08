//
//  SignInModel.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/19/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation

struct UserProfile {
    
    let userId: String?
    let displayName: String?
    let fullName: String?
    let email: String?
    let photoURL: String?
    //let city: String?
    //let state: String?
    //let groupName: String?
    //let joinedDate: String?
    //let bio: String?
    
    
    init(userId: String, displayName: String, fullName: String, email: String, city: String, photoURL:String) {
        self.userId = userId
        self.fullName = fullName
        self.displayName = displayName
        self.email = email
//        self.city = city
//        self.state = state
//        self.groupName = groupName
//        self.joinedDate = joinedDate
//        self.bio = bio
        self.photoURL = photoURL
        
    }
    init(dict: [String: Any]) {
        self.userId = dict[ProfileCollectionKeys.CollectionKey] as? String ?? ""
        self.displayName = dict[ProfileCollectionKeys.CollectionKey] as? String ?? ""
        self.fullName = dict[ProfileCollectionKeys.CollectionKey] as? String ?? ""
        self.email = dict[ProfileCollectionKeys.CollectionKey] as? String ?? ""
        self.photoURL = dict[ProfileCollectionKeys.CollectionKey] as? String ?? ""
       // self.groupName = dict[ProfileCollectionKeys.CollectionKey] as? String ?? ""
       // self.joinedDate = dict[ProfileCollectionKeys.CollectionKey] as? String ?? ""
       // self.city = dict[ProfileCollectionKeys.CollectionKey] as? String ?? ""
      //  self.state = dict[ProfileCollectionKeys.CollectionKey] as? String ?? ""
        //self.bio = dict[ProfileCollectionKeys.CollectionKey] as? String ?? ""
    }
}

//
//  PrayerPost.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 7/30/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation
import Firebase

struct PrayerCreatedByUser {
    let location: String
    let createdAt: String
    let userId: String
    let photoURL: String
    let prayerDescription: String
    let praiseDescription: String
    let displayName: String
    let email: String
    let documentId: String
    
    init(location: String, createdAt: String, userId: String, photoURL: String, prayerDescription: String, praiseDescription:String, displayName: String, email: String, documentId: String) {
        self.location = location
        self.createdAt = createdAt
        self.userId = userId
        self.photoURL = photoURL
        self.prayerDescription = prayerDescription
        self.praiseDescription = praiseDescription
        self.displayName = displayName
        self.email = email
        self.documentId = documentId
    }
    init(dict: [String: Any]) {
        self.location = dict[PrayerCollectionKeys.Location] as? String ?? "No Location Name"
        self.createdAt = dict[PrayerCollectionKeys.CreatedAt] as? String ?? "No Created Date"
        self.userId = dict[PrayerCollectionKeys.UserID] as? String ?? "No One Logged In"
        self.photoURL = dict[PrayerCollectionKeys.PhotoURL] as? String ?? "No Photo"
        self.prayerDescription = dict[PrayerCollectionKeys.PrayerDescription] as? String ?? "No Prayer Description"
        self.praiseDescription = dict[PrayerCollectionKeys.PraiseDescription] as? String ?? "No Prayer Description"
        self.displayName = dict[PrayerCollectionKeys.DisplayNameKey] as? String ?? "No Display Name"
        self.email = dict[PrayerCollectionKeys.EmailKey] as? String ?? "No Email"
        self.documentId = dict[PrayerCollectionKeys.DocumentIdKey] as? String ?? "No ID"
    }
    
}

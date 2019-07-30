//
//  DBService.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/19/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

struct PrayerCollectionKeys {
    static let Location = "locationString"
    static let CollectionKeys = "prayer"
    static let UserID = "userId"
    static let PhotoURL = "PhotoURL"
    static let DisplayNameKey = "displayName"
    static let FullName = "fullName"
    static let Lat = "lat"
    static let Long = "long"
    static let EmailKey = "email"
    static let IsTrusted = "isTrusted"
    static let CreatedAt = "createdAt"
    static let PrayerDescription = "PrayerDescription"
    static let PraiseDescription = "PraiseDescription"
    static let PrayerType = "prayerType"
    static let DocumentIdKey = "documentId"
}

struct ProfileCollectionKeys {
    static let CollectionKey = "Profile"
    static let ProfileIdKey = "ProfileId"
    static let DisplayNameKey = "displayName"
    static let FirstNameKey = "firstName"
    static let LastNameKey = "lastName"
    static let EmailKey = "email"
    static let PhotoURLKey = "photoURL"
    static let CoverImageURLKey = "coverImageURL"
    static let JoinedDateKey = "joinedDate"
    static let BioKey = "bio"
    static let FriendsKey = "friendsKey"
    static let PhotoBucket = "photoBucket"
    static let isBlocked = "isBlocked"
    static let PendingFriends = "PendingFriends"
}

final class DBService {
    private init() {}
    
    public static var firestoreDB: Firestore = {
        let db = Firestore.firestore()
        let settings = db.settings
        db.settings = settings
        return db
    }()
    
    static public var generateDocumentId: String {
        return firestoreDB.collection(ProfileCollectionKeys.CollectionKey).document().documentID
    }
    
    
    static public func createThroneRoomUser(user: UserProfile, completion: @escaping (Error?) -> Void) {
        firestoreDB.collection(PrayerCollectionKeys.CollectionKeys).document(user.userId!).setData([PrayerCollectionKeys.CollectionKeys : user.displayName,
                                                                                                    PrayerCollectionKeys.DisplayNameKey: user.displayName,
                                                                                                    PrayerCollectionKeys.EmailKey: user.email,
                                                                                                    PrayerCollectionKeys.DocumentIdKey: user.joinedDate])
            
        { (error) in
            if let error = error {
                completion(error)
            } else {
                completion(nil)
            }
        }
    }
    static public func postPrayer(prayer: PrayerCreatedByUser, completion: @escaping (Error?) -> Void) {
        firestoreDB.collection(PrayerCollectionKeys.CollectionKeys)
            .document(prayer.documentId).setData([
                PrayerCollectionKeys.CreatedAt : prayer.createdAt,
                PrayerCollectionKeys.UserID : prayer.userId,
                PrayerCollectionKeys.PrayerDescription : prayer.prayerDescription,
                PrayerCollectionKeys.DisplayNameKey : prayer.displayName,
                PrayerCollectionKeys.Location: prayer.location,
                PrayerCollectionKeys.EmailKey: prayer.email
                ])
            { (error) in
                if let error = error {
                    print("posting prayer error: \(error)")
                } else {
                    print("prayer posted successfully to ref: \(prayer.documentId)")
                }
        }
    }
    static public func deletePrayer(blog: PrayerCreatedByUser, completion: @escaping (Error?) -> Void) {
        DBService.firestoreDB
            .collection(PrayerCollectionKeys.CollectionKeys)
            .document(blog.documentId)
            .delete { (error) in
                if let error = error {
                    completion(error)
                } else {
                    completion(nil)
                }
        }
    }
    static public func fetchUser(userId: String, completion: @escaping (Error?, UserProfile?) -> Void) {
        DBService.firestoreDB
            .collection(ProfileCollectionKeys.CollectionKey)
            .whereField(ProfileCollectionKeys.ProfileIdKey, isEqualTo: userId)
            .getDocuments { (snapshot, error) in
                if let error = error {
                    completion(error, nil)
                } else if let snapshot = snapshot?.documents.first {
                    let prayerCreator = UserProfile(dict: snapshot.data())
                    completion(nil, prayerCreator)
                }
        }
}
    static public func fetchThroneRoomUser(userId: String, completion: @escaping (Error?, UserProfile?) -> Void) {
        DBService.firestoreDB
            .collection(ProfileCollectionKeys.CollectionKey)
            .whereField(ProfileCollectionKeys.ProfileIdKey, isEqualTo: userId)
            .getDocuments { (snapshot, error) in
                if let error = error {
                    completion(error, nil)
                } else if let snapshot = snapshot?.documents.first {
                    let blogCreator = UserProfile(dict: snapshot.data())
                    completion(nil, blogCreator)
                }
        }
    }
}

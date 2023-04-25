//
//  StorageManager.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 19.04.2023.
//

import Foundation
import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    let realm = try? Realm()
    
    static func getLoggedStatusUser(realm: Realm) -> String? {
        let loggedStatus = realm.objects(LoggedStatus.self)
        print("loggedStatus: \(loggedStatus)")
        for log in loggedStatus {
            if log.status {
                return log.email
            }
        }
        return nil
    }
    
    static func getLoggedUser(realm: Realm, email: String) -> User? {
        let users = realm.objects(User.self)
        
        for user in users {
            if user.email == email {
                return user
            }
        }
        return nil
    }
}

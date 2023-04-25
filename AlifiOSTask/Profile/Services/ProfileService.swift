//
//  ProfileService.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 20.04.2023.
//

import Foundation


class ProfileServiceImpl: ProfileService {
    func logOut() throws {
        guard let realm = StorageManager.shared.realm else {
            throw CustomError.realmInstanceNotExisting
        }
        
        let loggedStatus = realm.objects(LoggedStatus.self)
        if let loggedUser = loggedStatus.first(where: { $0.status }) {
            try realm.write {
                loggedUser.status = false
            }
        } else {
            throw CustomError.userNotExisting
        }
        
    }
    
    func deleteAccount() throws {
        guard let realm = StorageManager.shared.realm else {
            throw CustomError.realmInstanceNotExisting
        }
        
        let loggedStatus = realm.objects(LoggedStatus.self)
        let users = realm.objects(User.self)
        
        guard let loggedUser = loggedStatus.first(where: { $0.status }), let user = users.first(where: { $0.email == loggedUser.email}) else {
            throw CustomError.userNotExisting
        }
        
        try realm.write {
            realm.delete(loggedUser)
            realm.delete(user)
        }
    }
    
    func showUserInfo() throws -> String {
        guard let realm = StorageManager.shared.realm else {
            throw CustomError.realmInstanceNotExisting
        }
        
        let logged = realm.objects(LoggedStatus.self)
        for log in logged {
            if log.status {
                return log.email
            }
        }
        return ""
    }
}

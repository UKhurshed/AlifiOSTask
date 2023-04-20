//
//  LoginService.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 20.04.2023.
//

import Foundation
import RealmSwift


class LogInServiceImpl: LogInService {
    func logIn(user: UserViewInput) throws {
        if user.name.isEmpty || user.password.isEmpty {
            throw CustomError.textFieldsEmpty
        } else {
            guard let realm = StorageManager.shared.realm else {
                throw CustomError.realmInstanceNotExisting
            }
            
            let users = realm.objects(User.self)
            let currentUser = users.where { $0.name == user.name && $0.password == user.password }
            if currentUser.isEmpty {
                let newUser = User()
                newUser.name = user.name
                newUser.password = user.password
                
                try realm.write {
                    realm.add(newUser)
                }
            } else {
                print("user: \(currentUser)")
            }

            try changeLoggedStatus(realm: realm, name: user.name, status: true)
        }
    }
    
    private func changeLoggedStatus(realm: Realm, name: String, status: Bool) throws {
        let loggedStatus = realm.objects(LoggedStatus.self)
        
        if loggedStatus.isEmpty {
            let newLoggedStatus = LoggedStatus()
            newLoggedStatus.name = name
            newLoggedStatus.status = status
        } else {
            let currentUser = loggedStatus.where{ $0.name == name }
            if currentUser.isEmpty {
                let newLoggedStatus = LoggedStatus()
                newLoggedStatus.name = name
                newLoggedStatus.status = status
            } else {
                if let firstUser = currentUser.first {
                    try realm.write {
                        firstUser.status = status
                    }
                }
            }
        }
    }
}


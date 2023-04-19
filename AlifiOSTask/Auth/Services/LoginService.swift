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
        if user.name.isEmpty || user.email.isEmpty || user.password.isEmpty {
            throw CustomError.textFieldsEmpty
        } else {
            guard let realm = StorageManager.shared.realm else {
                throw CustomError.realmInstanceNotExisting
            }
            let users = realm.objects(User.self)
            let currentUser = users.where { $0.name == user.name && $0.email == user.email && $0.password == user.password }
            if currentUser.isEmpty {
                let newUser = User()
                newUser.name = user.name
                newUser.email = user.email
                newUser.password = user.password
                
                try realm.write {
                    realm.add(newUser)
                }
                
            } else {
                print("user: \(currentUser)")
            }
            
            let status = realm.objects(LoggedStatus.self).first
            try realm.write {
                status?.status = true
            }
        }
    }
}


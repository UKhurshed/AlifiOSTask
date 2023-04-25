//
//  LoginService.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 20.04.2023.
//

import Foundation
import RealmSwift
import UIKit


class LogInServiceImpl: LogInService {
    func logIn(user: UserViewInput) throws {
        if user.email.isEmpty || user.password.isEmpty {
            throw CustomError.textFieldsEmpty
        } else {
            guard let realm = StorageManager.shared.realm else {
                throw CustomError.realmInstanceNotExisting
            }
            
            let users = realm.objects(User.self)
            let currentUser = users.where { $0.email == user.email && $0.password == user.password }
            if currentUser.isEmpty {
                let newUser = User()
                newUser.email = user.email
                newUser.password = user.password
                
                try realm.write {
                    realm.add(newUser)
                }
            } else {
                print("user: \(currentUser)")
            }

            try changeLoggedStatus(realm: realm, email: user.email, status: true)
        }
    }
    
    private func changeLoggedStatus(realm: Realm, email: String, status: Bool) throws {
        let loggedStatus = realm.objects(LoggedStatus.self)
        
        if loggedStatus.isEmpty {
            let newLoggedStatus = LoggedStatus()
            newLoggedStatus.email = email
            newLoggedStatus.status = status
            try realm.write {
                realm.add(newLoggedStatus)
            }
        } else {
            let currentUser = loggedStatus.where{ $0.email == email }
            if currentUser.isEmpty {
                let newLoggedStatus = LoggedStatus()
                newLoggedStatus.email = email
                newLoggedStatus.status = status
                try realm.write {
                    realm.add(newLoggedStatus)
                }
            } else {
                if let firstUser = currentUser.first {
                    try realm.write {
                        firstUser.status = status
                    }
                }
            }
        }
        let newLogged = realm.objects(LoggedStatus.self)
        print("newLogged: \(newLogged)")
    }
}

class AuthChecking {
    static func check() -> UIViewController {
        
        guard let realm = StorageManager.shared.realm else {
            print("realm error")
            return AuthAssembly.configureModule()
        }
        
        let logged = realm.objects(LoggedStatus.self)
        print("logged: \(logged)")
        
        if logged.isEmpty {
            print("logged empty")
            return AuthAssembly.configureModule()
        } else {
            for log in logged {
                if log.status {
                    return TabBarViewController()
                }
            }
            print("otsutstvuet error")
            return AuthAssembly.configureModule()
        }
    }
}

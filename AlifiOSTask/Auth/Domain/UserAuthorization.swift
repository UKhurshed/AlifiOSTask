//
//  UserAuthorization.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 20.04.2023.
//

import Foundation

protocol UserAuthorization: AnyObject {
    func userAuth(user: UserViewInput) throws
}

protocol LogInService: AnyObject {
    func logIn(user: UserViewInput) throws
}

class UserAuthorizationImpl: UserAuthorization {
    let service: LogInService
    
    init(service: LogInService) {
        self.service = service
    }
    
    func userAuth(user: UserViewInput) throws {
        
        try service.logIn(user: user)
        
    }
}

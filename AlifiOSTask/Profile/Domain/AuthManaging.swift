//
//  AuthManaging.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 20.04.2023.
//

import Foundation

protocol AuthManaging {
    func logOut() throws
    func deleteAccount() throws
    func showUserInfo() throws -> String
}

protocol ProfileService: AnyObject {
    func logOut() throws
    func deleteAccount() throws
    func showUserInfo() throws -> String
}


class AuthManagingImpl: AuthManaging {
    
    let profileService: ProfileService
    
    init(profileService: ProfileService) {
        self.profileService = profileService
    }
    
    func logOut() throws {
        try profileService.logOut()
    }
    
    func deleteAccount() throws {
        try profileService.deleteAccount()
    }
    
    func showUserInfo() throws -> String {
       return try profileService.showUserInfo()
    }
}

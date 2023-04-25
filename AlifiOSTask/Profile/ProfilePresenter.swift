//
//  ProfilePresenter.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 20.04.2023.
//

import Foundation

protocol ProfileViewInput {
    func logOut()
    func deleteAccount()
    func showUserInfo()
}

protocol ProfileDisplayLogic: AnyObject {
    func success()
    func success(userName: String)
    func showError(errorMessage: String)
}


class ProfilePresenter: ProfileViewInput {
    
    weak var viewController: ProfileDisplayLogic?
    var authManaging: AuthManaging!
    
    func logOut() {
        do {
            try authManaging.logOut()
            viewController?.success()
        } catch {
            viewController?.showError(errorMessage: error.localizedDescription)
        }
    }
    
    func deleteAccount() {
        do {
            try authManaging.deleteAccount()
            viewController?.success()
        } catch {
            viewController?.showError(errorMessage: error.localizedDescription)
        }
    }
    
    func showUserInfo() {
        do {
            let userName = try authManaging.showUserInfo()
            viewController?.success(userName: userName)
        } catch {
            viewController?.showError(errorMessage: error.localizedDescription)
        }
    }
}

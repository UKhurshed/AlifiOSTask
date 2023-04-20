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
}

protocol ProfileDisplayLogic: AnyObject {
    func success()
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
}

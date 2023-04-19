//
//  AuthPresenter.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 20.04.2023.
//

import Foundation

protocol AuthViewInput {
    func logInUser(user: UserViewInput)
}

protocol DisplayLogic: AnyObject {
    func showLoader()
    func hideLoader()
    func success()
    func showError(errorMessage: String)
}

class AuthPresenter: AuthViewInput {
    
    weak var viewController: DisplayLogic?
    var userAuthorization: UserAuthorization!
    
    func logInUser(user: UserViewInput) {
        viewController?.showLoader()
        do {
            viewController?.hideLoader()
            try userAuthorization.userAuth(user: user)
            viewController?.success()
        } catch {
            viewController?.showError(errorMessage: error.localizedDescription)
        }
    }
}

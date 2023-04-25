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

protocol AuthDisplayLogic: AnyObject {
    func showLoader()
    func hideLoader()
    func success()
    func showError(errorMessage: String)
}

class AuthPresenter: AuthViewInput {
    
    weak var viewController: AuthDisplayLogic?
    var userAuthorization: UserAuthorization!
    
    func logInUser(user: UserViewInput) {
        viewController?.showLoader()
        do {
            self.viewController?.hideLoader()
            try userAuthorization.userAuth(user: user)
            viewController?.success()
        } catch {
            print("AuthPresenter error: \(error.localizedDescription)")
            viewController?.showError(errorMessage: error.localizedDescription)
        }
    }
}

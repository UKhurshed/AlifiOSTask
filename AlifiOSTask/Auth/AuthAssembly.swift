//
//  AuthAssembly.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 20.04.2023.
//

import UIKit

class UsersAssembly {
    static func configureModule() -> UIViewController {
        let view = AuthViewController()
        let service = LogInServiceImpl()
        let interactor = UserAuthorizationImpl(service: service)
        let presenter = AuthPresenter()
        
        view.authPresenter = presenter
        presenter.userAuthorization = interactor
        presenter.viewController = view
        
        return view
    }
}

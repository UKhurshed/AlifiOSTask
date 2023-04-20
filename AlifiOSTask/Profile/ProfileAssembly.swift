//
//  ProfileAssembly.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 20.04.2023.
//

import UIKit

class ProfileAssembly {
    static func configure() -> UIViewController {
        let view = ProfileViewController()
        let service = ProfileServiceImpl()
        let interactor = AuthManagingImpl(profileService: service)
        let presenter = ProfilePresenter()
        
        view.profileInputView = presenter
        presenter.authManaging = interactor
        presenter.viewController = view
        
        return view
    }
}

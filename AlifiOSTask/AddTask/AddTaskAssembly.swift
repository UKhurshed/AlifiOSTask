//
//  AddTaskAssembly.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 25.04.2023.
//

import UIKit

class AddTaskAssembly {
    static func configureModule() -> UIViewController {
        let view = AddTaskViewController()
        let service = AddTaskServiceImpl()
        let interactor = AddUserTaskImpl(service: service)
        let presenter = AddTaskPresenter()
        
        view.presenter = presenter
        presenter.addUserTask = interactor
        presenter.viewController = view
        
        return view
    }
}

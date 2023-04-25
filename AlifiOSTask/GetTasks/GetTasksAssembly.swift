//
//  GetTasksAssembly.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 25.04.2023.
//

import UIKit

class GetTasksAssembly {
    static func configureModule() -> UIViewController {
        let view = GetTasksViewController()
        let service = GetUserTasksServiceImpl()
        let interactor = GetCurrentUserTasksImpl(service: service)
        let presenter = GetAllTasksPresenter()
        
        view.presenter = presenter
        presenter.getCurrentUserTasks = interactor
        presenter.viewController = view
        
        return view
    }
}

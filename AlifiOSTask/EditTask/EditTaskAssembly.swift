//
//  EditTaskAssembly.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 25.04.2023.
//

import UIKit

class EditTaskAssembly {
    static func configureModule(task: Task) -> UIViewController {
        let view = EditTaskViewController(task: task)
        let service = EditTaskServiceImpl()
        let interactor = EditUserTaskImpl(service: service)
        let presenter = EditTaskPresenter()
        
        view.presenter = presenter
        presenter.editUserTask = interactor
        presenter.viewController = view
        
        return view
    }
}

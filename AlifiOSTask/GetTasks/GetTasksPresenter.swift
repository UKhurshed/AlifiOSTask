//
//  GetTasksPresenter.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 25.04.2023.
//

import Foundation


protocol GetAllTasksInputView {
    func getAllTasks()
    func deleteTask(task: Task)
}

protocol GetAllTasksDislplayLogic: AnyObject {
    func success(user: UserViewModel)
    func success()
    func showError(errorMessage: String)
}

class GetAllTasksPresenter: GetAllTasksInputView {
    
    var getCurrentUserTasks: GetCurrentUserTasks!
    weak var viewController: GetAllTasksDislplayLogic?
    
    func getAllTasks() {
        do {
            let user = try getCurrentUserTasks.getTasks()
            viewController?.success(user: user)
        } catch {
            viewController?.showError(errorMessage: error.localizedDescription)
        }
    }
    
    func deleteTask(task: Task) {
        do {
            try getCurrentUserTasks.deleteTask(task: task)
            viewController?.success()
        } catch {
            viewController?.showError(errorMessage: error.localizedDescription)
        }
    }
}

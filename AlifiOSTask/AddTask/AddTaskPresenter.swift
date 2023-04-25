//
//  AddTaskPresenter.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 25.04.2023.
//

import Foundation

protocol AddTaskInputView {
    func addTask(note: String, priority: Priority)
}

protocol AddTaskDisplayLogic: AnyObject {
    func success()
    func showError(errorMessage: String)
}

class AddTaskPresenter: AddTaskInputView {
    
    var addUserTask: AddUserTask!
    weak var viewController: AddTaskDisplayLogic?
    
    func addTask(note: String, priority: Priority) {
        do {
            try addUserTask.addNote(note: note, priority: priority)
            viewController?.success()
        } catch {
            viewController?.showError(errorMessage: error.localizedDescription)
        }
    }
}

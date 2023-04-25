//
//  EditTaskPresenter.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 25.04.2023.
//

import Foundation

protocol EditTaskInputView {
    func editTask(editTaskModel: EditTaskModel)
}

protocol EditTaskDisplayLogic: AnyObject {
    func success()
    func showError(errorMessage: String)
}


class EditTaskPresenter: EditTaskInputView {
    
    var editUserTask: EditUserTask!
    weak var viewController: EditTaskDisplayLogic?
    
    func editTask(editTaskModel: EditTaskModel) {
        do {
            try editUserTask.editUserTask(editTask: editTaskModel)
            viewController?.success()
        } catch {
            viewController?.showError(errorMessage: error.localizedDescription)
        }
    }
}

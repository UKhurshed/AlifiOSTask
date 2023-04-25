//
//  EditUserTask.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 25.04.2023.
//

import Foundation

protocol EditUserTask {
    func editUserTask(editTask: EditTaskModel) throws
}

protocol EditTaskService {
    func editTask(editTask: EditTaskModel) throws
}


class EditUserTaskImpl: EditUserTask {
    
    private let service: EditTaskService
    
    init(service: EditTaskService) {
        self.service = service
    }
    
    func editUserTask(editTask: EditTaskModel) throws {
        try service.editTask(editTask: editTask)
    }
}

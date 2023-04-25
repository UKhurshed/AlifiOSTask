//
//  AddUserTask.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 25.04.2023.
//

import Foundation

protocol AddUserTask {
    func addNote(note: String, priority: Priority) throws
}

protocol AddTaskService {
    func add(note: String, priority: Priority) throws
}

class AddUserTaskImpl: AddUserTask {
    
    let service: AddTaskService
    
    init(service: AddTaskService) {
        self.service = service
    }
    
    func addNote(note: String, priority: Priority) throws {
        try service.add(note: note, priority: priority)
    }
}

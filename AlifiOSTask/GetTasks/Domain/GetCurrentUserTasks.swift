//
//  GetCurrentUserTasks.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 25.04.2023.
//

import Foundation

protocol GetCurrentUserTasks {
    func getTasks() throws  -> UserViewModel
    func deleteTask(task: Task) throws
}

protocol GetUserTasksService {
    func getUserTasks() throws -> UserViewModel
    func deleteTask(task: Task) throws
}

class GetCurrentUserTasksImpl: GetCurrentUserTasks {
    
    let service: GetUserTasksService
    
    init(service: GetUserTasksService) {
        self.service = service
    }
    
    func getTasks() throws -> UserViewModel {
       return try service.getUserTasks()
    }
    
    func deleteTask(task: Task) throws {
        try service.deleteTask(task: task)
    }
}

//
//  GetUserTasksService.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 25.04.2023.
//

import Foundation
import RealmSwift

class GetUserTasksServiceImpl: GetUserTasksService {
    func getUserTasks() throws -> UserViewModel {
        guard let realm = StorageManager.shared.realm else {
            throw CustomError.realmInstanceNotExisting
        }
        
        guard let email = StorageManager.getLoggedStatusUser(realm: realm) else {
            throw CustomError.userStatusNotFound
        }
        
        guard let user = StorageManager.getLoggedUser(realm: realm, email: email) else {
            throw CustomError.userNotFound
        }
        
        var tasks = [Task]()
        
        for task in user.tasks {
            tasks.append(task)
        }
        
        let userViewModel = UserViewModel(id: user.id.stringValue, email: user.email, password: user.password, tasks: tasks)
        
        print("userViewModel: \(userViewModel)")

        return userViewModel
    }
    
    func deleteTask(task: Task) throws {
        guard let realm = StorageManager.shared.realm else {
            throw CustomError.realmInstanceNotExisting
        }
        
        guard let email = StorageManager.getLoggedStatusUser(realm: realm) else {
            throw CustomError.userStatusNotFound
        }
        
        guard let user = StorageManager.getLoggedUser(realm: realm, email: email) else {
            throw CustomError.userNotFound
        }
        
        guard let getCurrentTask = getTask(user: user, deleteTask: task) else {
            throw CustomError.taskNotFound
        }
        
        try realm.write {
            realm.delete(getCurrentTask)
        }
        
        let newUserTasks = StorageManager.getLoggedUser(realm: realm, email: email)
        print("newUserTasks: \(newUserTasks)")
    }
    
    private func getTask(user: User, deleteTask: Task) -> Task? {
        for task in user.tasks {
            if task.id == deleteTask.id {
                return task
            }
        }
        return nil
    }
}

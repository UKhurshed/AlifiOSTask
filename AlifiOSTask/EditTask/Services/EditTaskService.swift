//
//  EditTaskService.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 25.04.2023.
//

import Foundation


class EditTaskServiceImpl: EditTaskService {
    func editTask(editTask: EditTaskModel) throws {
        
        if editTask.note.isEmpty {
            throw CustomError.noteEmpty
        } else {
            guard let realm = StorageManager.shared.realm else {
                throw CustomError.realmInstanceNotExisting
            }
            
            guard let email = StorageManager.getLoggedStatusUser(realm: realm) else {
                throw CustomError.userStatusNotFound
            }
            
            guard let user = StorageManager.getLoggedUser(realm: realm, email: email) else {
                throw CustomError.userNotFound
            }
            
            guard let task = getTask(user: user, editTask: editTask) else {
                throw CustomError.taskNotFound
            }
            
            try realm.write {
                task.note = editTask.note
                task.priority = editTask.priority
            }
        }
    }
    
    private func getTask(user: User, editTask: EditTaskModel) -> Task? {
        for task in user.tasks {
            if task.id.stringValue == editTask.id {
                return task
            }
        }
        return nil
    }
}

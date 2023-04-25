//
//  AddTaskService.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 25.04.2023.
//

import Foundation
import RealmSwift


class AddTaskServiceImpl: AddTaskService {
    func add(note: String, priority: Priority) throws {
        if note.isEmpty {
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
            
            try realm.write {
                let task = Task.create(withNote: note, priority: priority)
                realm.add(task)
                user.tasks.append(task)
            }
            
            let newUsers = StorageManager.getLoggedUser(realm: realm, email: email)
            print("newUsers: \(newUsers)")
        }
    }
}

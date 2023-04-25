//
//  User.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 20.04.2023.
//

import Foundation
import RealmSwift

class User: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var email: String
    @Persisted var password: String
    @Persisted var tasks: List<Task>
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    static func create(withEmail email: String, withPassword password: String) -> User {
        let user = User()
        user.email = email
        user.password = password
        user.tasks = List<Task>()
        return user
    }
}

class Task: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var note: String
    @Persisted var createdAt: Date
    @Persisted var priorityNum: Int
    @Persisted var isComplete: Bool
    let creditCard = LinkingObjects(fromType: User.self, property: "user")
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    static func create(withNote note: String, priority: Priority) -> Task {
        let task = Task()
        task.note = note
        task.createdAt = Date()
        task.priority = priority
        task.isComplete = false
        return task
    }
}

extension Task: Identifiable {
    var priority: Priority {
        get {
            Priority(rawValue: Int(priorityNum)) ?? .normal
        }
        
        set {
            self.priorityNum = Int(newValue.rawValue)
        }
    }
}

enum Priority: Int {
    case low = 0
    case normal = 1
    case high = 2
    
    var priorityType: String {
        switch rawValue {
            case Priority.low.rawValue: return "low"
            case Priority.normal.rawValue: return "normal"
            case Priority.high.rawValue: return "high"
            
            default: return ""
        }
    }
    
    // to set color for each type of priorities
    func priorityColor() -> UIColor {
        switch rawValue {
            case Priority.low.rawValue: return .green
            case Priority.normal.rawValue: return .orange
            case Priority.high.rawValue: return .red
            
            default: return .orange
        }
    }
}

struct UserViewInput {
    let email: String
    let password: String
}

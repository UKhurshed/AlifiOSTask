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
    @Persisted var name: String
    @Persisted var password: String
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    static func create(withName name: String, withPassword password: String) -> User {
        let user = User()
        user.name = name
        user.password = password
        return user
    }
}

struct UserViewInput {
    let name: String
    let password: String
}

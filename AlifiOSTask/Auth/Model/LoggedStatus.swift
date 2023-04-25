//
//  LoggedStatus.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 19.04.2023.
//

import Foundation
import RealmSwift

class LoggedStatus: Object {
    @Persisted var email: String
    @Persisted var status: Bool
    
    static func create(email: String, status: Bool) -> LoggedStatus {
        let loggedStatus = LoggedStatus()
        loggedStatus.email = email
        loggedStatus.status = status
        return loggedStatus
    }
}

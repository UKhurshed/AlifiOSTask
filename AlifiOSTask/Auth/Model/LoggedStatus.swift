//
//  LoggedStatus.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 19.04.2023.
//

import Foundation
import RealmSwift

class LoggedStatus: Object {
    @Persisted var name: String
    @Persisted var status: Bool
    
    static func create(name: String, status: Bool) -> LoggedStatus {
        let loggedStatus = LoggedStatus()
        loggedStatus.name = name
        loggedStatus.status = status
        return loggedStatus
    }
}

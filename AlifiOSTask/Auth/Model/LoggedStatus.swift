//
//  LoggedStatus.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 19.04.2023.
//

import Foundation
import RealmSwift

class LoggedStatus: Object {
    @Persisted var status: Bool
    
    static func create(status: Bool) -> LoggedStatus {
        let loggedStatus = LoggedStatus()
        loggedStatus.status = status
        return loggedStatus
    }
}

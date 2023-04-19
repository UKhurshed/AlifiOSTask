//
//  StorageManager.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 19.04.2023.
//

import Foundation
import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    let realm = try? Realm()
}

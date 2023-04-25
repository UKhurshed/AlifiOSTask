//
//  CustomError.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 20.04.2023.
//

import Foundation

enum CustomError: Error {
    case textFieldsEmpty
    case realmInstanceNotExisting
    case userNotExisting
    case noteEmpty
    case userStatusNotFound
    case userNotFound
    case taskNotFound
}


extension CustomError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .textFieldsEmpty:
            return R.string.localizable.emptyTextField()
        case .realmInstanceNotExisting:
            return R.string.localizable.realmInstanceNotExisting()
        case .userNotExisting:
            return R.string.localizable.userNotExisting()
        case .noteEmpty:
            return R.string.localizable.noteEmptyWarning()
        case .userStatusNotFound:
            return R.string.localizable.userStatusNotFound()
        case .userNotFound:
            return R.string.localizable.userNotFound()
        case .taskNotFound:
            return R.string.localizable.taskNotFound()
        }
    }
}

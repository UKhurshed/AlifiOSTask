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
}


extension CustomError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .textFieldsEmpty:
            return R.string.localizable.emptyTextField()
        case .realmInstanceNotExisting:
            return R.string.localizable.realmInstanceNotExisting()
        }
    }
}

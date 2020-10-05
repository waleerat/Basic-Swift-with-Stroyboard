//
//  UserInfo.swift
//  authentication-IOS
//
//  Created by Waleerat Gottlieb on 2020-09-29.
//

import Foundation

struct userInfo {
    let uid: NSString
    let firstname: String
    let lastname: String
    let updated: String
    static let collectionName = "userInfo"
    struct fieldName {
        static let uid = "uid"
        static let firstname = "firstname"
        static let lastname = "lastname"
        static let updated = "updated"
        static let mobile = "mobile"
        
    }
}
  

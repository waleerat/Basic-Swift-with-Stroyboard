//
//  Profile.swift
//  My-PIA-Course
//
//  Created by Waleerat Gottlieb on 2020-10-02.
//

import Foundation
public struct Profile: Codable {
    let firstname: String
    let lastname: String?
    let gendar: String?
    let profileImage: String?
    let isActive: Bool?

    enum CodingKeys: String, CodingKey {
        case firstname
        case lastname
        case gendar
        case profileImage
        case isActive = "0"
    }
}

//
//  profile.swift
//  My-PIA-Course
//
//  Created by Waleerat Gottlieb on 2020-10-02.
//

import Foundation
public struct City: Codable {

    let name: String
    let state: String?
    let country: String?
    let isCapital: Bool?
    let population: Int64?

    enum CodingKeys: String, CodingKey {
        case name
        case state
        case country
        case isCapital = "capital"
        case population
    }
}

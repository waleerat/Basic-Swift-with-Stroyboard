//
//  Country.swift
//  My-PIA-Course
//
//  Created by Waleerat Gottlieb on 2020-10-02.
//

import Foundation
import FirebaseFirestoreSwift

struct Continent {
    static let name = ["Asia", "Africa", "North America", "South America", "Antarctica", "Europe"]
}


// firestore will read the documentID of the document and map it into 'id'
public struct Country: Identifiable, Codable {
    @DocumentID  public var id: String? = UUID().uuidString
    let country: String?
    let capital: String?

    enum CodingKeys: String, CodingKey {
        case capital
        case country
        //case isCapital = "capital"
    }
}

public struct CountryFields: Codable {
    let landmass: String?
    let countryName: String

    enum CodingKeys: String, CodingKey {
        case countryName
        case landmass = "Unknown"
    }
}
 

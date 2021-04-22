//
//  Country.swift
//  SegmentedControl
//
//  Created by Massa Antonio on 21/04/21.
//

import Foundation

struct Country: Decodable {
    var name: String?
    var capital: String?
    var countryCode: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case capital = "capital"
        case countryCode = "alpha3code"
    }
}

//
//  MappingData.swift
//  SegmentedControl
//
//  Created by Massa Antonio on 19/04/21.
//

import Foundation
import ObjectMapper

class Vehicles: Mappable {
    
    var ManufacturerName: String?
    var TotalKm: Double?
    var TotalVehicles: Int?
    
    required init?(map: Map) {
   
    }
    
    func mapping(map: Map) {
        
        ManufacturerName <- map["manufacturerName"]
        TotalKm <- map["totalKm"]
        TotalVehicles <- map["totalVehicles"]
    }
    
}

//class Kilometers: Mappable {
//
//    var hubSerialNumber: String
//    var manufacturerName: String
//    var batteryCycles: Int
//    var userId: UUID
//    var totalKm: Double
//    var telemetryUtcDate: Data
//
//    required init?(map: Map) {
//        hubSerialNumber = ""
//        manufacturerName = ""
//        batteryCycles = 0
//        userId =
//        totalKm = 0.0
//     //  telemetryUtcDate =
//    }
//
//    func mapping(map: Map) {
//        <#code#>
//    }
//
//}


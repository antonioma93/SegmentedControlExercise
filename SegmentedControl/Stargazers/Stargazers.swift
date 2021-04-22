//
//  Stargazers.swift
//  SegmentedControl
//
//  Created by Massa Antonio on 22/04/21.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper

class Stargazer: Mappable {
    
    var login: String?
    var id: Int?
    var node_id: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        login <- map["login"]
        id    <- map["id"]
    node_id   <- map["node_id"]
    }
  
}

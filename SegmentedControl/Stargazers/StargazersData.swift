//
//  StargazersData.swift
//  SegmentedControl
//
//  Created by Massa Antonio on 22/04/21.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper


class StargazersData {
    
    var url = "https://api.github.com/repos/octocat/hello-world/stargazers"
    var stargazers: [Stargazer] = []
    
    
    func getData() {
        Alamofire.request(url).validate().responseArray(keyPath: "result") { (response: DataResponse<[Stargazer]>) in
            switch response.result {
            
            case .success:
                self.stargazers = response.result.value ?? []
                for stargazers in self.stargazers {
                    print(stargazers.id ?? "")
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
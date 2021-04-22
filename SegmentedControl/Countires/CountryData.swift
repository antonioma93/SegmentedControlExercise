//
//  CountryData.swift
//  SegmentedControl
//
//  Created by Massa Antonio on 21/04/21.
//

import Foundation
import Alamofire

class CountryData {
    //https://restcountries.eu/rest/v2
    
    var url = ""
    
    typealias countriesCall = (_ countries: [Country]?, _ status: Bool, _ message: String) -> Void
    
    var callBack: countriesCall?
    
    init(url: String) {
        self.url = url
    }
    
    func getCountryName(endPoint: String){
        Alamofire.request(url + endPoint, method: .get, encoding: URLEncoding.default).response {
            (responseData) in
            //  print("Successfully connect")
            guard let data = responseData.data else {
                self.callBack?(nil, false, "")
                
                return
            }
            
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                self.callBack?(countries, true,"")
                //   print("countries = \(countries)")
            }
            catch {
                //   print("Error when decode\(error)")
                self.callBack?(nil, false, error.localizedDescription)
            }
        }
    }
    
    func complitionHandler(callBack: @escaping countriesCall) {
        self.callBack = callBack
    }
}

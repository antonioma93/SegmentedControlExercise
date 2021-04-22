//
//  ViewController.swift
//  SegmentedControl
//
//  Created by Massa Antonio on 19/04/21.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    var countries = [Country]()
    var star = [Stargazer]()
    
    var currentTableView: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.backgroundColor = UIColor.systemBackground
       currentTableView = 0
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let country = CountryData(url: "https://restcountries.eu/rest/v2/")
        country.getCountryName(endPoint: "all")
        country.complitionHandler {(countries, status, message) in
          
            if status {
                guard let _countries = countries else {return}
                self.countries = _countries
                self.tableView.reloadData()
            }
            let stargaz = StargazersData()
            stargaz.getData()
        }
    }
    
    @IBAction func switchTable(_ sender: UISegmentedControl) {
       currentTableView = sender.selectedSegmentIndex
        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return countries.count
        if segmentControl.selectedSegmentIndex == 0 {
            return countries.count
        } else {
            return star.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "countrycell")

        if cell == nil {
            cell = UITableViewCell(style: .subtitle,
                                   reuseIdentifier: "countrycell")
        }

        let country = countries[indexPath.row]
        cell?.textLabel?.text = (country.name ?? "") + "" + (country.countryCode ?? "")
        cell?.detailTextLabel?.text = country.capital ?? ""

        return cell!
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell?
//
//        if segmentControl.selectedSegmentIndex == 0 {
//            print(countries)
//        }
//        else if segmentControl.selectedSegmentIndex == 1 {
//            print(star)
//        }
//
//        return cell!
//    }
}

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
    
    
    @IBOutlet weak var tableView: UITableView!
    var countries = [Country]()
    var values = [Stargazer]()
    
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
               // self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func switchTablw(_ sender: UISegmentedControl) {
        currentTableView = sender.selectedSegmentIndex
        
       // self.tableView.reloadData()
        if currentTableView == 1 {
            print(values)
        } else {
            self.tableView.reloadData()
        }
        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
        
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
    
}

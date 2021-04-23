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
        }
        let stargaz = StargazersData()
        stargaz.getStargazeName()
    }
    
    @IBAction func switchTable(_ sender: UISegmentedControl) {
        currentTableView = sender.selectedSegmentIndex
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var segment = 0
        switch segmentControl.selectedSegmentIndex {
        case 0:
            segment = countries.count
            break
        case 1:
            segment = star.count
            break
        default:
            break
            
        }
        return segment
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath)
        
        switch(segmentControl.selectedSegmentIndex) {
        case 0:
            cell.textLabel?.text = countries[indexPath.row].name
            cell.textLabel?.textColor = UIColor.orange
            cell.textLabel?.textAlignment = .center
            break
        case 1:
            cell.textLabel?.text = star[indexPath.row].login
            cell.textLabel?.textColor = UIColor.orange
            cell.textLabel?.textAlignment = .center
            break
        default:
            break
        }
        return cell
    }
}

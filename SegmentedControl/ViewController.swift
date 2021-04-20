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
    
    var showKm: [Vehicles]?
    
    var currentTableView: Int!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.backgroundColor = UIColor.systemBackground
        currentTableView = 0
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.loadDataVehicles()
        
        
    }
    
    @IBAction func switchTablw(_ sender: UISegmentedControl) {
        currentTableView = sender.selectedSegmentIndex
        
        if currentTableView == 0 {
            // loadDataKm()
        } else {
            //print("")
        }
        self.tableView.reloadData()
        loadDataVehicles()
    }
    
    func loadDataVehicles(){
        let url = "https://zehus-api-common-integration.azure-api.net/ZehusStatsApp/v1/Vehicle/GlobalInfo"
        
        Alamofire.request(url).responseObject { (response: DataResponse<Vehicles>) in
            let kms = response.result.value
            print(kms?.TotalKm as Any)
            print(kms?.TotalVehicles as Any)
            print(kms?.ManufacturerName as Any)
            
            self.tableView.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showKm?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")
        cell?.textLabel?.text = showKm?[indexPath.row].ManufacturerName
        cell?.textLabel?.textColor = UIColor.orange
        cell?.textLabel?.backgroundColor = UIColor.darkGray
        cell?.contentView.backgroundColor = UIColor.darkGray
        
        return cell!
    }
    
}



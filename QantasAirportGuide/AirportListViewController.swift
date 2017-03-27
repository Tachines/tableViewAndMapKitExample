//
//  AirportListViewController.swift
//  QantasAirportGuide
//
//  Created by Tachines on 12/3/17.
//  Copyright © 2017 Tac. All rights reserved.
//

import UIKit
import SwiftyJSON

class AirportListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var json: JSON = [:]
    // object array for all necessary data of an airport
    var airportItem: AirportItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white
        ]
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.title = "Qantas Airports"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue" {
            if let destinationViewController = segue.destination as? DetailPageViewController {
                destinationViewController.airportItem = airportItem
                destinationViewController.navigationItem.title = airportItem.name! + " Airport"
                let backItem = UIBarButtonItem()
                backItem.tintColor = .white
                backItem.title = "Back"
                navigationItem.backBarButtonItem = backItem
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "airportDetailCell", for: indexPath) as! AirportDetailCell
        cell.airportName.text = json[indexPath.row]["display_name"].string!
        cell.airportCode.text = json[indexPath.row]["code"].string!
        cell.countryName.text = json[indexPath.row]["country"]["display_name"].string!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let i = indexPath.row
        airportItem = AirportItem(name: json[i]["display_name"].string!, nameCode: json[i]["code"].string!, country: json[i]["country"]["display_name"].string!, currency: json[i]["currency_code"].string!, timezone: json[i]["timezone"].string!, location: [json[i]["location"]["latitude"].floatValue, json[i]["location"]["longitude"].floatValue])
        performSegue(withIdentifier: "showDetailSegue", sender: nil)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json.count
    }
   
    
   
    
    
    
   //     airportItem.append(AirportItem(name: json["airports"][i]["display_name"].string!, nameCode: json["airports"][i]["code"].string!, country: json["airports"][i]["country"]["display_name"].string!, currency: json["airports"][i]["currency_code"].string!, timezone: json["airports"][i]["timezone"].string!, location: [json["airports"][i]["location"]["latitude"].floatValue, json["airports"][i]["location"]["longitude"].floatValue]))
    
}

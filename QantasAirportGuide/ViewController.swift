//
//  ViewController.swift
//  QantasAirportGuide
//
//  Created by Tachines on 12/3/17.
//  Copyright © 2017 Tac. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import SwiftyJSON
import Alamofire
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!
    var json: JSON = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView.startAnimating()
        getData()
        
    }
    // Hide navigation bar
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAirportListSegue" {
            if let destinationViewController = segue.destination as? AirportListViewController {
                destinationViewController.json = json
            }
        }
    }
    
    func getData() {
        
        let qantasAirportUrl = "https://www.qantas.com.au/api/airports"
        let myUrl = URL(string: qantasAirportUrl)
        
        Alamofire.request(myUrl!, method: .get).validate().responseJSON { response in
            switch response.result {
                case .success:
                if let value = response.result.value {
                    let jsonReceived = JSON(value)
                    self.json = jsonReceived["airports"]
                    // store received data to local file for offline. It's not a good way comparing with Core Data,
                    // but it saves time to finish this task :)
                    let filePath = NSHomeDirectory() + "/Documents/airportList"
                    let writeData = self.json.description.data(using: String.Encoding.utf8)
                    FileManager.default.createFile(atPath: filePath, contents: writeData, attributes: nil)
                    self.performSegue(withIdentifier: "showAirportListSegue", sender: nil)
                }
                case .failure(let error):
                if error.localizedDescription == "The Internet connection appears to be offline." {
                    let alert = UIAlertController(title: "Warning", message: "Please connect to Internet and relaunch Qantas Airport, or click Open to load cached list", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Open", style: .default, handler: {action in
                        self.readFromLocal()
                    }))
                    self.present(alert, animated:true, completion:nil)
                    
                } else {
                    self.readFromLocal()
                }
            }
        }
    }
    
    func readFromLocal() {
        let fileManager = FileManager.default
        let filePath = NSHomeDirectory() + "/Documents/airportList"
        if fileManager.fileExists(atPath: filePath) {
            let data = try? Data(contentsOf: URL(fileURLWithPath: filePath))
            let jsonStoredList = JSON(data: data!)
            self.json = jsonStoredList
            self.activityIndicatorView.stopAnimating()
            self.performSegue(withIdentifier: "showAirportListSegue", sender: nil)
        }
    }
}


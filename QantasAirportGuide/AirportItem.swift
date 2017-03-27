//
//  AirportItem.swift
//  QantasAirportGuide
//
//  Created by Tachines on 13/3/17.
//  Copyright © 2017 Tac. All rights reserved.
//

import Foundation

// create airport item object
class AirportItem {
    var name: String?
    var nameCode: String?
    var country: String?
    var currency: String?
    var timezone: String?
    var location = [Float]()
    
    init(name: String, nameCode: String, country: String, currency: String, timezone: String, location: [Float]) {
        self.name = name
        self.nameCode = nameCode
        self.country = country
        self.currency = currency
        self.timezone = timezone
        self.location = location
    }
    
}

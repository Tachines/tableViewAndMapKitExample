//
//  AirportList.swift
//  QAirports
//
//  Created by Tachines on 13/3/17.
//  Copyright © 2017 Tac. All rights reserved.
//

import XCTest
@testable import QAirports

class AirportList: XCTestCase {
    var AirportVC: AirportListViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        AirportVC = storyboard.instantiateViewController(withIdentifier: "AirportListViewController") as! AirportListViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

//
//  QantasAirportGuideTests.swift
//  QantasAirportGuideTests
//
//  Created by Tachines on 12/3/17.
//  Copyright © 2017 Tac. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import QAirports

class QantasAirportGuideTests: XCTestCase {
    var VC: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        VC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testJsonValue() {
        VC.getData()
        let json = VC.json
        XCTAssertNotNil(json)
    }
}

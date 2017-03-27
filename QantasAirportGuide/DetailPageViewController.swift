//
//  DetailPageViewController.swift
//  Q Airports
//
//  Created by Tachines on 13/3/17.
//  Copyright © 2017 Tac. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class DetailPageViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var timezone: UILabel!
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var location: UILabel!
    var airportItem: AirportItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentMap()
        fillInContent()
    }
    // bring map to screen
    func presentMap() {
        // get location coordinates
        let location = CLLocation(latitude: CLLocationDegrees(airportItem.location[0]), longitude: CLLocationDegrees(airportItem.location[1]))
        let regionRadius: CLLocationDistance = 10000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        centerMapOnLocation(location: location)
        annotationOnMap(location: location)
    }
    func annotationOnMap(location: CLLocation) {
        let location2d = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let annotationData = AnnotationData(coordinate: location2d,
                                    title: airportItem.name! + " Airport",
                                    subtitle: "Country: " + airportItem.country!)
        
        mapView.addAnnotation(annotationData)
        mapView.selectAnnotation(annotationData, animated: true)
    }
    
    func fillInContent() {
        timezone.text = airportItem.timezone
        currency.text = airportItem.currency
        location.text = airportItem.location.description
    }
   
}

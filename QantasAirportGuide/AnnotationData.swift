//
//  AnnotationData.swift
//  Q Airports
//
//  Created by Tachines on 13/3/17.
//  Copyright © 2017 Tac. All rights reserved.
//

import Foundation
import MapKit

class AnnotationData : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

//
//  DUAnnotations.swift
//  introToSwift
//
//  Created by Fisal Alsabhan on 9/2/18.
//  Copyright © 2018 Fisal Alsabhan. All rights reserved.
//

import Foundation
import MapKit


class DUAnnotations: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var contact: String?
     init(coordinates: CLLocationCoordinate2D, titles: String, contacts: String) {
            self.coordinate = coordinates
        self.title = titles
        self.contact = contacts
        super.init()
    }
    init(coordinates: CLLocationCoordinate2D, titles: String) {
        self.coordinate = coordinates
        self.title = titles
        
        super.init()
    }
  
    
}

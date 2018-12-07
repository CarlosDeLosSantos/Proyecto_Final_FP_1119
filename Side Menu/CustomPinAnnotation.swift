//
//  CustomPinAnnotation.swift
//  Side Menu
//
//  Created by Usuario invitado on 12/4/18.
//  Copyright © 2018 Kyle Lee. All rights reserved.
//
import UIKit
import MapKit
class customPin: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    init(pinTitle: String, pinSubtitle: String, location: CLLocationCoordinate2D){
        self.title = pinTitle
        self.subtitle = pinSubtitle
        self.coordinate = location
       }
}

//
//  Location.swift
//  Pint
//
//  Created by Jan Bannister on 18/03/2024.
//

import Foundation
import MapKit

class Location: Identifiable {
    let id = UUID()
    let location: String
    let coordinate: CLLocationCoordinate2D
    
    init(location: String, coordinate: CLLocationCoordinate2D ) {
        self.location = location
        self.coordinate = coordinate
    }
}

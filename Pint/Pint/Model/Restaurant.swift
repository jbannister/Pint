//
//  Restaurant.swift
//  Pint
//
//  Created by Jan Bannister on 20/03/2024.
//

import Foundation
import MapKit

class Restaurant: Identifiable {
    let id = UUID()

    let name: String
    let address: String
    let coordinate: CLLocationCoordinate2D
    
    init(name: String, address: String, coordinate: CLLocationCoordinate2D ) {
        self.name = name
        self.address = address
        self.coordinate = coordinate
    }
}

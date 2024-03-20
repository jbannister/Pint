//
//  Person.swift
//  Pint
//
//  Created by Jan Bannister on 18/03/2024.
//

import Foundation
import Contacts
import MapKit

class Person: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let coordinate: CLLocationCoordinate2D

    init(name: String, address: String, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.address = address
        self.coordinate = coordinate
    }
}

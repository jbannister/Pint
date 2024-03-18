//
//  Location.swift
//  Pint
//
//  Created by Jan Bannister on 18/03/2024.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let coordinate: CLLocationCoordinate2D
}

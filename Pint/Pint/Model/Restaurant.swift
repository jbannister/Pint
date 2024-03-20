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
    
    static let example = [
        Restaurant(name: "Stein's Richmond",
                   address: "Towpath, Petersham Rd, Richmond TW10 6UX",
                   coordinate: CLLocationCoordinate2D(latitude: 51.455589315498806,
                                                      longitude: -0.3035535660221578)),
        
        Restaurant(name: "The Ivy Richmond Brasserie",
                   address: "9-11 Hill St, Richmond TW9 1SX",
                   coordinate: CLLocationCoordinate2D(latitude: 51.45938358024964,
                                                      longitude: -0.30536310110921067)),
        
        Restaurant(name: "No 1a Duke Street",
                   address: "1A Duke St, Richmond TW9 1HP",
                   coordinate: CLLocationCoordinate2D(latitude: 51.46154614957121,
                                                      longitude: -0.3031292878561238)),
        
        Restaurant(name: "Lord Wargrave",
                   address: "40-42 Brendon St, London W1H 5HE",
                   coordinate: CLLocationCoordinate2D(latitude: 51.51861135830564,  
                                                      longitude: -0.16511729533715208)),
        
        Restaurant(name: "Bistro1",
                   address: "27 Frith St, London W1D 5LE",
                   coordinate: CLLocationCoordinate2D(latitude: 51.513178980031995,
                                                      longitude: -0.12999232142179984))
    ]
}

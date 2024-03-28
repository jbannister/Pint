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
    
    var region: MKCoordinateRegion {
            MKCoordinateRegion(center: coordinate,
                               latitudinalMeters: 1000,
                               longitudinalMeters: 1000)
    }
    
    var placemark: MKPlacemark {
        //ToDo: CNPostalAddress
        MKPlacemark(coordinate: coordinate)
    }
    
    var mapItem: MKMapItem {
        MKMapItem(placemark: placemark)
    }
        
    static var example = [
       Person(name: "Jan",
                address: "49 King George, Richmond",
                coordinate:
                   CLLocationCoordinate2D(latitude: 51.453630,
                                          longitude: -0.290940)),
       Person(name: "MC",
                address: "Church Road, Richmond",
                coordinate: CLLocationCoordinate2D(latitude: 51.460864,
                                                   longitude: -0.297149)),
       
       Person(name: "Shane Donnelly",
                address: "New Road, Reading",
                coordinate: CLLocationCoordinate2D(latitude: 51.443950,
                                                   longitude: -0.952680)),
       
       Person(name: "Colin O'Sullivan",
                address: "West Norwood, London",
                coordinate: CLLocationCoordinate2D(latitude: 51.43462818592707,
                                                   longitude: -0.10384535281600316)),
       
       Person(name: "Tall Connaughton",
                address: "Folgate Street, London",
                coordinate: CLLocationCoordinate2D(latitude: 51.52080696041292,
                                                   longitude: -0.07618033285277254))
   ]

}

//
//  MapView.swift
//  Pint
//
//  Created by Jan Bannister on 17/03/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var persons = [
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
        
    var body: some View {
        Map {
            ForEach(persons) { person in
                Marker(person.name, coordinate: person.coordinate)
            }
        }
            
    }
}

#Preview {
    MapView()
}

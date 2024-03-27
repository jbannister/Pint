//
//  PersonDetailView.swift
//  Pint
//
//  Created by Jan Bannister on 27/03/2024.
//

import SwiftUI
import MapKit

struct PersonDetailView: View {
    @State var person: Person
    var body: some View {
        Form {
                        
            Section {
                Text(person.address)
            } header: {
                Text("Address")
                    .font(.subheadline)
            }
            
            Section {
                Map(initialPosition: MapCameraPosition.item(person.mapItem)) {
                    Marker(person.name, coordinate: person.coordinate)
                }.frame(minHeight: 300)
            } header: {
                Text("Home")
                    .font(.subheadline)
            }
        }.navigationTitle(person.name)
        
    }
}

#Preview {
    PersonDetailView(person: Person.example[0])
}

//
//  PersonView.swift
//  Pint
//
//  Created by Jan Bannister on 17/03/2024.
//

import SwiftUI
import MapKit

struct PersonView: View {
    
    @State var persons = [
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
        Form {
            List {
                ForEach(persons) { person in
                    NavigationLink {
                        Text("Item at \(person.name)")
                    } label: {
                        Text(person.name)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addPerson) {
                        Label("Add Person", systemImage: "plus")
                    }
                }
            }
        }
    }
    
    private func addPerson() {
        withAnimation {
            let newPerson = Person(name: "Anon", 
                                   address: "Address",
                                   coordinate: CLLocationCoordinate2D(latitude: 51.453630,
                                                                      longitude: -0.290940))
            persons.append(newPerson)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                // persons[index] // Delete
            }
        }
    }
}

#Preview {
    PersonView()
}

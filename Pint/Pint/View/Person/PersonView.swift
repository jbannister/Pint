//
//  PersonView.swift
//  Pint
//
//  Created by Jan Bannister on 17/03/2024.
//

import SwiftUI
import MapKit

struct PersonView: View {
    
    @State var persons = Person.example

    var body: some View {
        NavigationView {
            Form {
                ForEach(persons) { person in
                    NavigationLink(destination: Text("Item at \(person.name)")) {
                        Text(person.name)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationBarTitle("Persons", displayMode: .large)
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

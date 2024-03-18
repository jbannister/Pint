//
//  PersonView.swift
//  Pint
//
//  Created by Jan Bannister on 17/03/2024.
//

import SwiftUI

struct PersonView: View {
    @State var persons = [Person(name: "Jan Bannoster"),
                          Person(name: "MC"),
                          Person(name: "Shane Donnelly"),
                          Person(name: "Colin O'Sullivan"),
                          Person(name: "Tall Connaughton")]

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
            let newPerson = Person(name: "Anon")
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

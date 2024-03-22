//
//  RestaurantListView.swift
//  Pint
//
//  Created by Jan Bannister on 20/03/2024.
//

import SwiftUI
import MapKit

struct RestaurantListView: View {
    @State private var restaurants = Restaurant.example
    var body: some View {
        NavigationView {
            
            Form {
                ForEach(restaurants) { restaurant in
                    NavigationLink(destination: RestaurantView(restaurant: restaurant)) {
                        Text(restaurant.name)
                    }
                }
                .onDelete(perform: deleteRestaurants)
            }
            .navigationBarTitle("Restaurant List", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addRestaurants) {
                        Label("Add Person", systemImage: "plus")
                    }
                }
            }

        }
    }
    
    private func addRestaurants() {
        withAnimation {
            let newRestaurant = Restaurant(name: "Anon",
                                           address: "Address",
                                           coordinate: CLLocationCoordinate2D(latitude: 51.453630,
                                                                              longitude: -0.290940))
            restaurants.append(newRestaurant)
        }
    }

    private func deleteRestaurants(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                // restaurants[index] // Delete
            }
        }
    }
}

#Preview {
    RestaurantListView()
}

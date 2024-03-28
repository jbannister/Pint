//
//  RestaurantView.swift
//  Pint
//
//  Created by Jan Bannister on 20/03/2024.
//

import SwiftUI
import MapKit

struct RestaurantView: View {
    @State var restaurant: Restaurant
    var body: some View {
        Form {
            Section {
                GeometryReader { geometry in
                    Map(initialPosition: restaurant.cameraPosition) {
                        Marker(restaurant.name, coordinate: restaurant.coordinate)
                    }
                    .frame(width: geometry.size.width * 0.9, height: 300) // 90% of parent's width
                }
                .frame(height: 300)
            }
            
            Section {
                VStack {
                    RestaurantWeeksView(restaurant: restaurant)
                }
            } header: {
                Text("Weeks")
            }
            
            Section {
                //ToDo: List
            } header: {
                Text("Week Restaurant List")
            }
            
        }.navigationTitle(restaurant.name)
    }
}

#Preview {
    RestaurantView(restaurant: Restaurant.example[0])
}

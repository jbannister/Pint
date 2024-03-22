//
//  RestaurantDetailView.swift
//  Pint
//
//  Created by Jan Bannister on 22/03/2024.
//

import SwiftUI
import MapKit

struct RestaurantDetailView: View {
    @State var restaurant: Restaurant
    var body: some View {
        VStack(alignment: .leading) {
            Text(restaurant.name)
            
            GeometryReader { geometry in
                Map(initialPosition: restaurant.cameraPosition) {
                    Marker(restaurant.name, coordinate: restaurant.coordinate)
                }
                .frame(width: geometry.size.width * 0.9, height: 300) // 90% of parent's width
            }
            .frame(height: 300)
        }
    }
}

#Preview {
    RestaurantDetailView(restaurant: Restaurant.example[0])
}

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
            Map(initialPosition: restaurant.cameraPosition)
                .frame(width: 200, height: 100) 
        }
    }
}

#Preview {
    RestaurantDetailView(restaurant: Restaurant.example[0])
}

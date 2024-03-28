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
            
            VStack {
                RestaurantWeeksView(restaurant: restaurant)
            }
        }
    }
}

#Preview {
    RestaurantDetailView(restaurant: Restaurant.example[0])
}

//
//  RestaurantListView.swift
//  Pint
//
//  Created by Jan Bannister on 20/03/2024.
//

import SwiftUI

struct RestaurantListView: View {
    @State private var restaurants = Restaurant.example
    var body: some View {
        ForEach(restaurants) { restaurant in
            RestaurantView(restaurant: restaurant)
        }
    }
}

#Preview {
    RestaurantListView()
}

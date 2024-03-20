//
//  RestaurantView.swift
//  Pint
//
//  Created by Jan Bannister on 20/03/2024.
//

import SwiftUI

struct RestaurantView: View {
    @State var restaurant: Restaurant
    var body: some View {
        VStack {
            Text(restaurant.name)
            Text(restaurant.address)
        }
    }
}

#Preview {
    RestaurantView(restaurant: Restaurant.example[0])
}

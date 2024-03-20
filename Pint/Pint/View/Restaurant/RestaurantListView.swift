//
//  RestaurantListView.swift
//  Pint
//
//  Created by Jan Bannister on 20/03/2024.
//

import SwiftUI

struct RestaurantListView: View {
    @State private var restaurants = [Restaurant]()
    var body: some View {
        
        ForEach(restaurants) { restaurant in
            Text(restaurant.name)
        }
        
        Text("Restaurant List")
    }
}

#Preview {
    RestaurantListView()
}

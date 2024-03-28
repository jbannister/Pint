//
//  RestaurantWeeksView.swift
//  Pint
//
//  Created by Jan Bannister on 27/03/2024.
//

import SwiftUI

struct RestaurantWeeksView: View {
    @State var restaurant: Restaurant
    private let count = 25
    var body: some View {
        Section {
            HStack {
                ForEach(0..<count, id: \.self) { _ in
                    Rectangle()
                }
                .frame(width: 5, height: 5)
                .tint(.green)
            }
            HStack {
                ForEach(0..<count, id: \.self) { _ in
                    Rectangle()
                }
                .frame(width: 5, height: 5)
                .tint(.green)
            }
            HStack {
                ForEach(0..<count, id: \.self) { _ in
                    Rectangle()
                }
                .frame(width: 5, height: 5)
                .tint(.green)
            }
            HStack {
                ForEach(0..<count, id: \.self) { _ in
                    Rectangle()
                }
                .frame(width: 5, height: 5)
                .tint(.green)
            }
            HStack {
                ForEach(0..<count, id: \.self) { _ in
                    Rectangle()
                }
                .frame(width: 5, height: 5)
                .tint(.green)
            }
            HStack {
                ForEach(0..<count, id: \.self) { _ in
                    Rectangle()
                }
                .frame(width: 5, height: 5)
                .tint(.green)
            }
            HStack {
                ForEach(0..<count, id: \.self) { _ in
                    Rectangle()
                }
                .frame(width: 5, height: 5)
                .tint(.green)
            }
            Spacer()
        }
    }
}

#Preview {
    RestaurantWeeksView(restaurant: Restaurant.example[0])
}

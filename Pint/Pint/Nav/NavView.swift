//
//  NavView.swift
//  Pint
//
//  Created by Jan Bannister on 17/03/2024.
//

import SwiftUI

struct NavView: View {
    
    var body: some View {
        TabView {
            PersonView()
                .tabItem {
                    Label("Person", systemImage: "person.fill")
                }
            
            RestaurantListView()
                .tabItem {
                    Label("Restaurant", systemImage: "fork.knife")
                }
            
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
            
            WeekView()
                .tabItem {
                    Label("Week", systemImage: "calendar")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    NavView()
}

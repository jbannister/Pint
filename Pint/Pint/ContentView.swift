//
//  ContentView.swift
//  Pint
//
//  Created by Jan Bannister on 17/03/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        TabView {
            PersonView()
                .tabItem {
                    Label("Person", systemImage: "person.fill")
                }
            
            WeekView()
                .tabItem {
                    Label("Week", systemImage: "calendar")
                }
            
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
            
            CombinedView()
                .tabItem {
                    Label("Combined", systemImage: "person.3.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

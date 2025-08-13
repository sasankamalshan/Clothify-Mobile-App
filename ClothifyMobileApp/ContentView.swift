//
//  ContentView.swift
//  ClothifyMobileApp
//
//  Created by Sasanka Malshan on 2025-08-13.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            CartView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }
                .tag(1)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
                .tag(3)
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

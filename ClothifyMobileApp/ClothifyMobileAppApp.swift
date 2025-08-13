//
//  ClothifyMobileAppApp.swift
//  ClothifyMobileApp
//
//  Created by Sasanka Malshan on 2025-08-13.
//

import SwiftUI
import SwiftData

@main
struct ClothifyMobileAppApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}

//
//  SettingsView.swift
//  ClothifyMobileApp
//
//  Created by Sasanka Malshan on 2025-08-13.
//

import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var selectedLanguage = "English"
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Preferences")) {
                    HStack {
                        Image(systemName: "bell.fill")
                            .foregroundColor(.orange)
                        Toggle("Notifications", isOn: $notificationsEnabled)
                    }
                    
                    HStack {
                        Image(systemName: "moon.fill")
                            .foregroundColor(.purple)
                        Toggle("Dark Mode", isOn: $darkModeEnabled)
                    }
                    
                    HStack {
                        Image(systemName: "globe")
                            .foregroundColor(.blue)
                        Text("Language")
                        Spacer()
                        Text(selectedLanguage)
                            .foregroundColor(.secondary)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                }
                
                Section(header: Text("Account")) {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(.green)
                        Text("Account Settings")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                    
                    HStack {
                        Image(systemName: "creditcard.fill")
                            .foregroundColor(.blue)
                        Text("Payment Methods")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                    
                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundColor(.red)
                        Text("Shipping Address")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                }
                
                Section(header: Text("Support")) {
                    HStack {
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundColor(.orange)
                        Text("Help & Support")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                    
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.blue)
                        Text("About")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                }
                
                Section {
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .foregroundColor(.red)
                        Text("Sign Out")
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}

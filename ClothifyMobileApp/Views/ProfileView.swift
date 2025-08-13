//
//  ProfileView.swift
//  ClothifyMobileApp
//
//  Created by Sasanka Malshan on 2025-08-13.
//

import SwiftUI

struct ProfileView: View {
    @State private var user = UserProfile(
        name: "John Doe",
        email: "john.doe@example.com",
        phone: "+1 (555) 123-4567",
        address: "123 Fashion Street, Style City, SC 12345"
    )
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 25) {
                    // Profile Header
                    VStack(spacing: 15) {
                        Circle()
                            .fill(Color.blue.gradient)
                            .frame(width: 120, height: 120)
                            .overlay {
                                Text(user.initials)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                        
                        VStack(spacing: 5) {
                            Text(user.name)
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text(user.email)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Button("Edit Profile") {
                            // Handle edit profile
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding(.top, 20)
                    
                    // Profile Information
                    VStack(spacing: 20) {
                        ProfileInfoCard(title: "Personal Information") {
                            VStack(spacing: 15) {
                                ProfileInfoRow(icon: "person.fill", title: "Full Name", value: user.name)
                                ProfileInfoRow(icon: "envelope.fill", title: "Email", value: user.email)
                                ProfileInfoRow(icon: "phone.fill", title: "Phone", value: user.phone)
                                ProfileInfoRow(icon: "location.fill", title: "Address", value: user.address)
                            }
                        }
                        
                        ProfileInfoCard(title: "Order History") {
                            VStack(spacing: 15) {
                                ProfileInfoRow(icon: "bag.fill", title: "Total Orders", value: "12")
                                ProfileInfoRow(icon: "clock.fill", title: "Last Order", value: "2 days ago")
                                ProfileInfoRow(icon: "dollarsign.circle.fill", title: "Total Spent", value: "$1,234.56")
                            }
                        }
                        
                        ProfileInfoCard(title: "Preferences") {
                            VStack(spacing: 15) {
                                ProfileInfoRow(icon: "heart.fill", title: "Wishlist Items", value: "8")
                                ProfileInfoRow(icon: "star.fill", title: "Favorite Brands", value: "5")
                                ProfileInfoRow(icon: "tshirt.fill", title: "Preferred Size", value: "M")
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer(minLength: 100)
                }
            }
            .navigationTitle("Profile")
        }
    }
}

struct UserProfile {
    let name: String
    let email: String
    let phone: String
    let address: String
    
    var initials: String {
        let components = name.components(separatedBy: " ")
        let firstInitial = String(components.first?.first ?? "U")
        let lastInitial = components.count > 1 ? String(components.last?.first ?? "U") : ""
        return "\(firstInitial)\(lastInitial)".uppercased()
    }
}

struct ProfileInfoCard<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
            
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct ProfileInfoRow: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(.blue)
                .frame(width: 25)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(value)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
            
            Spacer()
        }
    }
}

#Preview {
    ProfileView()
}

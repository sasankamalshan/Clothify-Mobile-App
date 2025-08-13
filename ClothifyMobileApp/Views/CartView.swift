//
//  CartView.swift
//  ClothifyMobileApp
//
//  Created by Sasanka Malshan on 2025-08-13.
//

import SwiftUI

struct CartItem {
    let id = UUID()
    let name: String
    let price: Double
    let image: String
    var quantity: Int
    let size: String
}

struct CartView: View {
    @State private var cartItems = [
        CartItem(name: "Cotton T-Shirt", price: 29.99, image: "tshirt.fill", quantity: 2, size: "M"),
        CartItem(name: "Denim Jeans", price: 79.99, image: "figure.dress.line.vertical.figure", quantity: 1, size: "L"),
        CartItem(name: "Summer Dress", price: 59.99, image: "figure.dress.line.vertical.figure", quantity: 1, size: "S")
    ]
    
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if cartItems.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "cart")
                            .font(.system(size: 80))
                            .foregroundColor(.gray)
                        
                        Text("Your Cart is Empty")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Add some items to get started")
                            .foregroundColor(.secondary)
                        
                        Button("Start Shopping") {
                            // Navigate to home or products
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        ForEach(cartItems.indices, id: \.self) { index in
                            CartItemRow(item: $cartItems[index]) {
                                cartItems.remove(at: index)
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    
                    // Cart Summary
                    VStack(spacing: 15) {
                        Divider()
                        
                        HStack {
                            Text("Subtotal")
                                .font(.headline)
                            Spacer()
                            Text("$\(totalPrice, specifier: "%.2f")")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                        Button("Proceed to Checkout") {
                            // Handle checkout
                        }
                        .buttonStyle(.borderedProminent)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                }
            }
            .navigationTitle("Cart")
        }
    }
}

struct CartItemRow: View {
    @Binding var item: CartItem
    let onDelete: () -> Void
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: item.image)
                .font(.system(size: 30))
                .foregroundColor(.blue)
                .frame(width: 60, height: 60)
                .background(Color.blue.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(item.name)
                    .font(.headline)
                    .lineLimit(2)
                
                Text("Size: \(item.size)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text("$\(item.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Spacer()
            
            VStack(spacing: 10) {
                HStack(spacing: 15) {
                    Button {
                        if item.quantity > 1 {
                            item.quantity -= 1
                        }
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(item.quantity > 1 ? .blue : .gray)
                    }
                    .disabled(item.quantity <= 1)
                    
                    Text("\(item.quantity)")
                        .font(.headline)
                        .frame(minWidth: 20)
                    
                    Button {
                        item.quantity += 1
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                    }
                }
                
                Button {
                    onDelete()
                } label: {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    CartView()
}

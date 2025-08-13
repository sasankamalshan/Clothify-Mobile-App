import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    // Hero Container with image carousel
                    HeroContainer()
                    
                    // Main Content Container
                    MainContentContainer()
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

// MARK: - Hero Container Component with Auto-Rotating Images
struct HeroContainer: View {
    @State private var currentImageIndex = 0
    @State private var timer: Timer?
    
    // Local fashion images from Assets.xcassets (extensions රහිතව)
    private let fashionImages: [String] = [
        "tshirt1", // Assets.xcassets හි image set name
        "Hoodie1",
        "Hoodie2",
        "hodi3"
    ]

    private let fashionTitles = [
        "Premium T-Shirts",
        "Designer Hoodies",
        "Street Style Hoodies",
        "Trendy Hoodies"
    ]
    
    private let fashionSubtitles = [
        "Comfortable cotton t-shirts",
        "Premium quality hoodies",
        "Urban streetwear collection",
        "Latest hoodie trends"
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Image Carousel Container
            ZStack {
                // Rotating Images with TabView
                TabView(selection: $currentImageIndex) {
                    ForEach(0..<fashionImages.count, id: \.self) { index in
                        ZStack {
                            // Local Image from Assets with fallback
                            if let uiImage = UIImage(named: fashionImages[index]) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 300)
                                    .clipped()
                                    .onAppear {
                                        print("✅ Successfully loaded image: \(fashionImages[index])")
                                    }
                            } else {
                                // Fallback if image not found
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.blue.opacity(0.6), 
                                                Color.purple.opacity(0.8)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(height: 300)
                                    .overlay(
                                        VStack(spacing: 8) {
                                            Image(systemName: "photo.artframe")
                                                .font(.system(size: 50, weight: .light))
                                                .foregroundColor(.white.opacity(0.7))
                                            Text("Image not found: \(fashionImages[index])")
                                                .foregroundColor(.white.opacity(0.7))
                                                .font(.caption)
                                                .fontWeight(.medium)
                                        }
                                    )
                                    .onAppear {
                                        print("❌ Failed to load image: \(fashionImages[index])")
                                    }
                            }
                            
                            // Gradient Overlay for text readability
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.clear,
                                    Color.black.opacity(0.3),
                                    Color.black.opacity(0.8)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            
                            // Content Overlay
                            VStack {
                                Spacer()
                                
                                HStack {
                                    VStack(alignment: .leading, spacing: 12) {
                                        // Main Title
                                        Text(fashionTitles[index])
                                            .font(.system(size: 28, weight: .bold, design: .rounded))
                                            .foregroundStyle(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [.white, .white.opacity(0.9)]),
                                                    startPoint: .leading,
                                                    endPoint: .trailing
                                                )
                                            )
                                            .shadow(color: .black.opacity(0.6), radius: 3, x: 1, y: 2)
                                        
                                        // Subtitle
                                        Text(fashionSubtitles[index])
                                            .font(.system(size: 16, weight: .medium))
                                            .foregroundColor(.white.opacity(0.95))
                                            .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 1)
                                        
                                        // CTA Button
                                        Button(action: {
                                            // Shop now action එක handle කිරීම
                                        }) {
                                            HStack(spacing: 10) {
                                                Text("Shop Now")
                                                    .font(.system(size: 16, weight: .bold))
                                                Image(systemName: "arrow.right.circle.fill")
                                                    .font(.system(size: 16, weight: .bold))
                                            }
                                            .foregroundColor(.black)
                                            .padding(.horizontal, 24)
                                            .padding(.vertical, 12)
                                            .background(
                                                Capsule()
                                                    .fill(.white)
                                                    .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
                                            )
                                        }
                                        .padding(.top, 8)
                                        .scaleEffect(1.0)
                                        .animation(.easeInOut(duration: 0.2), value: currentImageIndex)
                                    }
                                    
                                    Spacer()
                                    
                                    // Fashion Badge
                                    VStack(spacing: 8) {
                                        ZStack {
                                            Circle()
                                                .fill(.white.opacity(0.2))
                                                .frame(width: 50, height: 50)
                                                .blur(radius: 1)
                                            
                                            Image(systemName: "sparkles")
                                                .font(.system(size: 26, weight: .medium))
                                                .foregroundColor(.white)
                                                .shadow(color: .black.opacity(0.5), radius: 2, x: 1, y: 1)
                                        }
                                        
                                        Text("NEW")
                                            .font(.system(size: 12, weight: .bold))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 4)
                                            .background(
                                                Capsule()
                                                    .fill(.red)
                                                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
                                            )
                                    }
                                }
                                .padding(.horizontal, 24)
                                .padding(.bottom, 32)
                            }
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 300)
                
                // Custom Page Indicators
                VStack {
                    Spacer()
                    
                    HStack(spacing: 10) {
                        ForEach(0..<fashionImages.count, id: \.self) { index in
                            Capsule()
                                .fill(currentImageIndex == index ? Color.white : Color.white.opacity(0.5))
                                .frame(
                                    width: currentImageIndex == index ? 24 : 8,
                                    height: 8
                                )
                                .scaleEffect(currentImageIndex == index ? 1.0 : 0.8)
                                .animation(.spring(response: 0.6, dampingFraction: 0.8), value: currentImageIndex)
                        }
                    }
                    .padding(.bottom, 80)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(color: .black.opacity(0.2), radius: 15, x: 0, y: 8)
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .onAppear {
                startImageRotation()
            }
            .onDisappear {
                stopImageRotation()
            }
        }
    }
    
    private func startImageRotation() {
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 1.0)) {
                currentImageIndex = (currentImageIndex + 1) % fashionImages.count
            }
        }
    }
    
    private func stopImageRotation() {
        timer?.invalidate()
        timer = nil
    }
}

// MARK: - Main Content Container Component
struct MainContentContainer: View {
    var body: some View {
        VStack(spacing: 25) {
            // Featured Collections Container
            FeaturedCollectionsContainer()
            
            // Categories Container
            CategoriesContainer()
            
            // New Arrivals Container
            NewArrivalsContainer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 25)
    }
}

// MARK: - Featured Collections Container
struct FeaturedCollectionsContainer: View {
    let collections = [
        ("Spring Essentials", "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=400&h=300&fit=crop"),
        ("Summer Vibes", "https://images.unsplash.com/photo-1434389677669-e08b4cac3105?w=400&h=300&fit=crop"),
        ("Elegant Evening", "https://images.unsplash.com/photo-1465145498025-928c7a71cab9?w=400&h=300&fit=crop"),
        ("Casual Comfort", "https://images.unsplash.com/photo-1544022613-e87ca75a784a?w=400&h=300&fit=crop")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Featured Collections")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Curated styles just for you")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Button("See All") {
                    // See all action එක handle කිරීම
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(Color.blue.opacity(0.1))
                )
            }
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2), spacing: 20) {
                ForEach(0..<collections.count, id: \.self) { index in
                    CollectionCard(
                        title: collections[index].0,
                        imageUrl: collections[index].1
                    )
                }
            }
        }
        .padding(.vertical, 10)
    }
}

// MARK: - Categories Container
struct CategoriesContainer: View {
    let categories = ["Men", "Women", "Kids", "Accessories"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Categories")
                .font(.title2)
                .fontWeight(.semibold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(categories, id: \.self) { category in
                        CategoryCard(title: category)
                    }
                }
                .padding(.horizontal, 5)
            }
        }
    }
}

// MARK: - New Arrivals Container
struct NewArrivalsContainer: View {
    let products = [
        ("Designer Dress", "$129.99", "https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=300&h=400&fit=crop"),
        ("Premium Jacket", "$199.99", "https://images.unsplash.com/photo-1543076447-215ad9ba6923?w=300&h=400&fit=crop"),
        ("Casual Top", "$49.99", "https://images.unsplash.com/photo-1571945153237-4929e783af4a?w=300&h=400&fit=crop"),
        ("Elegant Blouse", "$79.99", "https://images.unsplash.com/photo-1584370848010-d7fe6bc767ec?w=300&h=400&fit=crop"),
        ("Trendy Sweater", "$89.99", "https://images.unsplash.com/photo-1434389677669-e08b4cac3105?w=300&h=400&fit=crop")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("New Arrivals")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Latest fashion trends")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Button("View All") {
                    // View all action එක handle කිරීම
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.orange)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(Color.orange.opacity(0.1))
                )
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<products.count, id: \.self) { index in
                        ProductCard(
                            title: products[index].0,
                            price: products[index].1,
                            imageUrl: products[index].2
                        )
                    }
                }
                .padding(.horizontal, 5)
            }
        }
    }
}

// MARK: - Collection Card Component
struct CollectionCard: View {
    let title: String
    let imageUrl: String
    
    var body: some View {
        VStack(spacing: 0) {
            // Image Container
            ZStack {
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 140)
                        .clipped()
                } placeholder: {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.purple.opacity(0.3),
                                    Color.pink.opacity(0.5)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(height: 140)
                        .overlay(
                            VStack {
                                Image(systemName: "photo.artframe")
                                    .font(.title2)
                                    .foregroundColor(.white.opacity(0.8))
                                Text("Loading...")
                                    .font(.caption2)
                                    .foregroundColor(.white.opacity(0.7))
                            }
                        )
                }
                
                // Gradient overlay
                VStack {
                    Spacer()
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.clear,
                            Color.black.opacity(0.6)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 60)
                }
                
                // Title overlay
                VStack {
                    Spacer()
                    HStack {
                        Text(title)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 1)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.title3)
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 1)
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                }
            }
        }
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
        .scaleEffect(1.0)
        .onTapGesture {
            // Collection tap action එක handle කිරීම
        }
    }
}

// MARK: - Category Card Component
struct CategoryCard: View {
    let title: String
    
    var body: some View {
        VStack(spacing: 8) {
            Circle()
                .fill(Color.blue.opacity(0.2))
                .frame(width: 60, height: 60)
                .overlay {
                    Image(systemName: "tag.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                }
            
            Text(title)
                .font(.caption)
                .fontWeight(.medium)
        }
        .frame(width: 80)
    }
}

// MARK: - Product Card Component
struct ProductCard: View {
    let title: String
    let price: String
    let imageUrl: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Product Image
            ZStack {
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 140, height: 160)
                        .clipped()
                } placeholder: {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.blue.opacity(0.3),
                                    Color.indigo.opacity(0.5)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 140, height: 160)
                        .overlay(
                            VStack(spacing: 4) {
                                Image(systemName: "photo.artframe")
                                    .font(.title3)
                                    .foregroundColor(.white.opacity(0.8))
                                Text("Loading...")
                                    .font(.caption2)
                                    .foregroundColor(.white.opacity(0.7))
                            }
                        )
                }
                
                // Favorite button overlay
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            // Favorite toggle action එක handle කිරීම
                        }) {
                            Image(systemName: "heart")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                                .frame(width: 32, height: 32)
                                .background(
                                    Circle()
                                        .fill(.black.opacity(0.3))
                                        .blur(radius: 1)
                                )
                        }
                        .padding(.top, 8)
                        .padding(.trailing, 8)
                    }
                    Spacer()
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            // Product Info
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Text(price)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.orange)
                    
                    Spacer()
                    
                    // Rating stars
                    HStack(spacing: 2) {
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                                .font(.system(size: 10))
                                .foregroundColor(.yellow)
                        }
                    }
                }
                
                // Add to cart button
                Button(action: {
                    // Add to cart action එක handle කිරීම
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 14))
                        Text("Add")
                            .font(.system(size: 12, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(Color.black)
                    )
                }
                .padding(.top, 4)
            }
        }
        .frame(width: 140)
        .padding(.bottom, 8)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)
    }
}

#Preview {
    HomeView()
}

// MARK: - Individual Component Previews
#Preview("Hero Container") {
    HeroContainer()
        .padding()
}

#Preview("Featured Collections") {
    FeaturedCollectionsContainer()
        .padding()
}

#Preview("Categories") {
    CategoriesContainer()
        .padding()
}

#Preview("New Arrivals") {
    NewArrivalsContainer()
        .padding()
}

#Preview("Collection Card") {
    CollectionCard(
        title: "Spring Essentials",
        imageUrl: "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=400&h=300&fit=crop"
    )
    .frame(width: 200)
    .padding()
}

#Preview("Product Card") {
    ProductCard(
        title: "Designer Dress",
        price: "$129.99",
        imageUrl: "https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=300&h=400&fit=crop"
    )
    .padding()
}

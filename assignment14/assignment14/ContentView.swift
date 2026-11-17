//
//  ContentView.swift
//  Assignment 14: Gesture Recognition
//  Author: Erick Ramos
//  Date: 11/16/26
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Tab 1: Interactive Image Viewer & Legend
            ImageViewerView()
                .tabItem {
                    Label("Viewer", systemImage: "photo.fill")
                }
            
            // Tab 2: About the chosen image
            AboutImageViewView()
                .tabItem {
                    Label("About", systemImage: "info.circle.fill")
                }
            
            // Tab 3: Gesture Recognizer
            GesturesGuideView()
                .tabItem {
                    Label("Gestures", systemImage: "hand.point.up.left.fill")
                }
        }
        .accentColor(.blue)
    }
}

// Image Viewer Code
struct ImageViewerView: View {
    @State private var scale = 1.0
    @State private var offset = CGSize.zero
    @State private var lastOffset = CGSize.zero
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Image Canvas with Gestures
            GeometryReader { geometry in
                Image("kumano_kodo")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scale)
                    .offset(offset)
                    .animation(.easeInOut(duration: 0.3), value: scale)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .gesture(
                        // 1. Drag Gesture for Panning
                        DragGesture()
                            .onChanged { value in
                                offset = CGSize(
                                    width: lastOffset.width + value.translation.width,
                                    height: lastOffset.height + value.translation.height
                                )
                            }
                            .onEnded { _ in
                                lastOffset = offset
                            }
                    )
                    .simultaneousGesture(
                        // 2. Single Tap: Zoom In
                        TapGesture()
                            .onEnded { _ in
                                scale += 0.5
                            }
                    )
                    .highPriorityGesture(
                        // 3. Double Tap: Zoom Out
                        TapGesture(count: 2)
                            .onEnded {
                                scale = max(0.5, scale - 0.5)
                                if scale == 1.0 {
                                    offset = .zero
                                    lastOffset = .zero
                                }
                            }
                    )
                    .simultaneousGesture(
                        // 4. Long Press: Reset to Normal and Center
                        LongPressGesture(minimumDuration: 1.0)
                            .onEnded { _ in
                                scale = 1.0
                                offset = .zero
                                lastOffset = .zero
                            }
                    )
            }
            .edgesIgnoringSafeArea(.top)
            
            // Legend Overlay Card
            VStack(alignment: .leading, spacing: 8) {
                
                HStack(spacing: 12) {
                    LegendItem(icon: "hand.tap", title: "Tap", desc: "Zoom In")
                    LegendItem(icon: "hand.rays", title: "Double Tap", desc: "Zoom Out")
                    LegendItem(icon: "hand.tap.fill", title: "Long Press", desc: "Reset")
                    LegendItem(icon: "hand.draw", title: "Drag", desc: "Move")
                }
                
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
    }
}

// Helper View for the Legend
struct LegendItem: View {
    var icon: String
    var title: String
    var desc: String
    
    var body: some View {
        VStack(spacing: 3) {
            Image(systemName: icon)
                .font(.system(size: 16))
                .foregroundColor(.blue)
            Text(title)
                .font(.caption.bold())
            Text(desc)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

// About the Image
struct AboutImageViewView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Image("kumano_kodo")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                        .shadow(radius: 5)
                    
                    Text("The Kumano Kodo")
                        .font(.title.bold())
                    
                    Text("The Kumano Kodo is an ancient network of historic trails winding through the mountains of the Kii Peninsula in Japan. It is a destination with deep spiritual tranquility, historic stone markers, and breathtaking natural scenery.")
                        .font(.body)
                    
                    Text("Why I chose this location")
                        .font(.headline)
                        .padding(.top, 4)
                    
                    Text("I would love to visit this place one day to fully admire its beauty and find a sense of inner peace and tranquility. It looks like an extraordinary destination to explore scenic routes by bike, immerse oneself in nature, and study Japanese culture and language.")
                        .font(.body)
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("About the Image")
        }
    }
}

// Gestures Recognizers
struct GesturesGuideView: View {
    var body: some View {
        NavigationView {
            List {
                Section() {

                    GestureDetailRow(
                        icon: "hand.tap",
                        title: "Tap once to Zoom In",
                        description: "Increments the image scale modifier on each single tap, offering a quick and controlled way to zoom closer into details."
                    )
                    
                    GestureDetailRow(
                        icon: "hand.rays",
                        title: "Double Tap to Zoom Out",
                        description: "Configured to safely intercept double taps, decreasing the scale without triggering conflicting single taps."
                    )
                    
                    GestureDetailRow(
                        icon: "hand.tap.fill",
                        title: "Long-Press to Reset and center",
                        description: "Triggers after holding for 1 second, instantly returning the scale factor back to its baseline and resetting translation offsets."
                    )
                    
                    GestureDetailRow(
                        icon: "hands.draw",
                        title: "Drag around to Pan",
                        description: "Runs simultaneously with tap gestures to track user translation movements, allowing fluid dragging across the canvas to inspect specific parts of the image."
                    )
                }
            }
            .navigationTitle("Gesture Recognizer")
        }
    }
}

// Helper View for Gesture Guide Rows
struct GestureDetailRow: View {
    var icon: String
    var title: String
    var description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
}

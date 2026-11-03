//
//  ContentView.swift
//  Assignment 11: Tabbed Views and Context Menus
//  Author: Erick Ramos
//  Date: 11/02/2026
//

import SwiftUI

// Struct for the Day of the Dead tab
struct MuertosView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Hero Image representing Día de los Muertos
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.orange.opacity(0.15))
                            .frame(height: 200)
                        
                        Image("muertos")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    VStack(spacing: 6) {
                        Text("Día de los Muertos")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("Honoring Ancestry and Life")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("About the Celebration")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Día de los Muertos or Day of the Dead is a festive Mexican holiday where families welcome back the souls of their deceased relatives. Celebrated with colorful ofrendas or altars, marigolds, and sugar skulls, it focuses on joyous remembrance rather than mourning.")
                            .font(.body)
                            .lineSpacing(4)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.04), radius: 6, x: 0, y: 3)
                    .padding(.horizontal)
                    
                    Spacer(minLength: 30)
                }
            }
            .navigationTitle("Day of the Dead")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Struct for the 4th of July tab
struct IndependenceDayView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Hero Image representing Independence Day
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.red.opacity(0.15))
                            .frame(height: 200)
                        
                        Image("independence")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    VStack(spacing: 6) {
                        Text("4th of July")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("Independence Day")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("About the Celebration")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Independence Day commemorates the adoption of the Declaration of Independence in 1776, marking the birth of the United States. Celebrations nationwide feature dynamic parades, fireworks, backyard barbecues, and patriotic displays.")
                            .font(.body)
                            .lineSpacing(4)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.04), radius: 6, x: 0, y: 3)
                    .padding(.horizontal)
                    
                    Spacer(minLength: 30)
                }
            }
            .navigationTitle("4th of July")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Struct for the Holi tab
struct HoliView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Hero Image representing Holi
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.purple.opacity(0.15))
                            .frame(height: 200)
                        
                        Image("holi")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    VStack(spacing:-6) {
                        Text("Holi")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("The Festival of Colors")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("About the Celebration")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Holi is a vibrant ancient Hindu spring festival originating from the Indian subcontinent. Also known as the festival of love, participants playfully smear brightly colored powders on one another, dance to traditional music, and share sweets.")
                            .font(.body)
                            .lineSpacing(4)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.04), radius: 6, x: 0, y: 3)
                    .padding(.horizontal)
                    
                    Spacer(minLength: 30)
                }
            }
            .navigationTitle("Holi")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Main view, separated from the tab views to avoid having a long content view
struct ContentView: View {
    var body: some View {
        TabView {
            MuertosView()
                .tabItem {
                    Image(systemName: "sparkles")
                    Text("Day of the Dead")
                }
            
            IndependenceDayView()
                .tabItem {
                    Image(systemName: "flag.fill")
                    Text("4th of July")
                }
            
            HoliView()
                .tabItem {
                    Image(systemName: "paintpalette.fill")
                    Text("Holi")
                }
        }
        .accentColor(.indigo)
    }
}

#Preview {
    ContentView()
}

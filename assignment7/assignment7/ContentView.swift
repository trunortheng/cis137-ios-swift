//
//  ContentView.swift
//  Assignment 7: Bio App
//  Created by Erick Ramos
//  Date: 09/29/2026
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
    var body: some View {
        ZStack {

            Image("background_bio")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                
                Spacer()
                
                Text("Erick Ramos")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.black.gradient)
                    .multilineTextAlignment(.center)
                
                HStack(alignment: .midAccountAndName, spacing: 10) {
                    
                    Image("profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 176, height: 176)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(.white, lineWidth: 3)
                        }
                        .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                        .alignmentGuide(.midAccountAndName) { d in
                            d[VerticalAlignment.center]
                        }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        
                        Text("Mobile Developer")
                            .font(.headline)
                            .foregroundColor(.blue)
                        
                        Text("College of San Mateo")
                            .font(.subheadline)
                            .bold()
                        
                        Text("Biking • Yoga • Dancing")
                            .font(.caption)
                    }
                    .alignmentGuide(.midAccountAndName) { d in
                            d[VerticalAlignment.center]
                        }
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(16)
                
                // 3. About Me Section
                VStack(spacing: 12) {
                    Text("Oh, hey there!")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.primary)
                    
                    Text("I'm a Web and Mobile Application Development student with a passion for Artificial Intelligence and modern software development. When I'm not coding, I stay active and grounded through biking and yoga. I am part of the folklorico group Los Mestizos de San Jose and I love performing throughout the Bay Area.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                }
                .padding(20)
                .frame(maxWidth: 340)
                .background(.ultraThinMaterial)
                .cornerRadius(16)
                
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}

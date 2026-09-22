//
//  ContentView.swift
//  Assignment 5: First iOS App
//  Created by Erick Ramos
//  Date: 09/20/2026
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
            Text("Oh hey there! I'm Erick!")
                .font(.title)
//                .foregroundColor(.black)
                .foregroundStyle(.blue.gradient)
                .frame(width: 300)
            
            Image("profile")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(.white, lineWidth: 5)
                }
                .shadow(radius: 7)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

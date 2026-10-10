//
//  ContentView.swift
//  assignment8
//
//  Created by cisstudent on 10/9/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Image(systemName:"car.fill")
                    Text("Cars")
                }
                HStack {
                    Image(systemName:"house.fill")
                    Text("Home")
                }
                HStack {
                    Image(systemName:"figure.run")
                    Text("Fitness")
                }
                HStack {
                    Image(systemName:"fork.knife")
                    Text("Food")
                }
            }.navigationTitle("Menu")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

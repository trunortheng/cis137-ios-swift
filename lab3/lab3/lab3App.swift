//
//  lab3App.swift
//  Lab 3: MVVM Architecture and animation
//  Author: Erick Ramos
//  Date: 11/10/26
//

import SwiftUI

@main
struct lab3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: FlowerMemoryGame())
        }
    }
}

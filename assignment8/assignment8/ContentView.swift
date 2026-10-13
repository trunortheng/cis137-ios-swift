//
//  ContentView.swift
//  Assignment 8: List and Navigation Views
//  Created by Erick Ramos
//  Date: 10/12/2026
//

import SwiftUI

let menu = Bundle.main.decode([MenuSection].self,
                              from: "menu.json")

let musicMenu = Bundle.main.decode([MusicSection].self,
                              from: "music.json")

let carMenu = Bundle.main.decode([CarSection].self,
                              from: "cars.json")

let fitnessMenu = Bundle.main.decode([FitnessSection].self,
                              from: "fitness.json")

let homeMenu: [HomeSection] = Bundle.main.decode([HomeSection].self,
                              from: "home.json")

struct CarDetail: View {
    var body: some View {
        List {
            ForEach(carMenu) { section in
                NavigationLink(destination: {
                    List {
                        ForEach(section.items) { item in
                            NavigationLink(destination: {
                                VStack(spacing: 16) {
                                    Text(item.name)
                                        .font(.largeTitle)
                                        .bold()
                                        .multilineTextAlignment(.center)
                                    
                                    Text(item.description)
                                        .font(.body)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                    
                                    Spacer()
                                }
                                .padding()
                            }) {
                                Text(item.name)
                            }
                        }
                    }
                    .navigationTitle(section.name)
                }) {
                    Text(section.name)
                }
            }
        }
        .navigationTitle("Car Menu")
    }
}


struct FitnessDetail: View {
    var body: some View {
        List {
            ForEach(fitnessMenu) { section in
                NavigationLink(destination: {
                    List {
                        ForEach(section.items) { item in
                            NavigationLink(destination: {
                                VStack(spacing: 16) {
                                    Text(item.name)
                                        .font(.largeTitle)
                                        .bold()
                                        .multilineTextAlignment(.center)
                                    
                                    Text(item.description)
                                        .font(.body)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                    
                                    Spacer()
                                }
                                .padding()
                            }) {
                                Text(item.name)
                            }
                        }
                    }
                    .navigationTitle(section.name)
                }) {
                    Text(section.name)
                }
            }
        }
        .navigationTitle("Fitness Menu")
    }
}


struct HomeDetail: View {
    var body: some View {
        List {
            ForEach(homeMenu) { section in
                NavigationLink(destination: {
                    List {
                        ForEach(section.items) { item in
                            NavigationLink(destination: {
                                VStack(spacing: 16) {
                                    Text(item.name)
                                        .font(.largeTitle)
                                        .bold()
                                        .multilineTextAlignment(.center)
                                    
                                    Text(item.description)
                                        .font(.body)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                    
                                    Spacer()
                                }
                                .padding()
                            }) {
                                Text(item.name)
                            }
                        }
                    }
                    .navigationTitle(section.name)
                }) {
                    Text(section.name)
                }
            }
        }
        .navigationTitle("Home Menu")
    }
}

struct FoodDetail: View {
    var body: some View {
        ForEach(menu) { section in
            NavigationLink(destination: {
                ForEach(section.items){ item in
                    HStack{
                        Image(item.thumbnailImage)
                        Text(item.name)
                        }
                    }
                }
            )
            {
                Text(section.name)
            }
        }
    }
}

struct FoodDetailDescription: View {
    var body: some View {
        List {
            ForEach(menu) { section in
                NavigationLink(destination: {
                    List {
                        ForEach(section.items) { item in
                            NavigationLink(destination: {
                                VStack(spacing: 16) {
                                    Image(item.thumbnailImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 200)
                                        .cornerRadius(12)
                                    
                                    Text(item.name)
                                        .font(.largeTitle)
                                        .bold()
                                    
                                    Text(item.description)
                                        .font(.body)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                    
                                    Spacer()
                                }
                                .padding()
                            }) {
                                HStack {
                                    Image(item.thumbnailImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(8)
                                    
                                    Text(item.name)
                                }
                            }
                        }
                    }.navigationTitle(section.name)
                }) {
                    Text(section.name)
                }
            }
        }
        .navigationTitle("Food Menu")
    }
}

struct EntertainmentDetail: View {
    var body: some View {
        List {
            ForEach(musicMenu) { section in
                NavigationLink(destination: {
                    List {
                        ForEach(section.items) { item in
                            NavigationLink(destination: {
                                VStack(spacing: 16) {
                                    Text(item.name)
                                        .font(.largeTitle)
                                        .bold()
                                    
                                    Text(item.description)
                                        .font(.body)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                    
                                    Spacer()
                                }
                                .padding()
                            }) {
                                Text(item.name)
                            }
                        }
                    }
                    .navigationTitle(section.name)
                }) {
                    Text(section.name)
                }
            }
        }
        .navigationTitle("Music Menu")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination:
                    CarDetail()) {
                    HStack {
                        Image(systemName:"car.fill")
                        Text("Cars")
                    }
                }
                NavigationLink(destination:
                    HomeDetail()){
                    HStack {
                        Image(systemName:"house.fill")
                        Text("Home")
                    }
                }
                NavigationLink(destination:
                    FitnessDetail()) {
                    HStack {
                        Image(systemName:"figure.run")
                        Text("Fitness")
                    }
                }
                NavigationLink(destination:
                    FoodDetailDescription()) {
                    HStack {
                        Image(systemName:"fork.knife")
                        Text("Food")
                    }
                }
                NavigationLink(destination:
                    EntertainmentDetail()) {
                    HStack {
                        Image(systemName:"play.tv")
                        Text("Entertainment")
                    }
                }
            }.navigationTitle("Menu")
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

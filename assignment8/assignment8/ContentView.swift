//
//  ContentView.swift
//  assignment8
//
//  Created by cisstudent on 10/9/26.
//

import SwiftUI

let menu = Bundle.main.decode([MenuSection].self,
                              from: "menu.json")

struct CarDetail: View {
    var body: some View {
        List {
            VStack{
                Text("Tesla Model Y")
                Text("Honda Civic")
                Text("Ford Raptor")
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
                HStack {
                    Image(systemName:"house.fill")
                    Text("Home")
                }
                HStack {
                    Image(systemName:"figure.run")
                    Text("Fitness")
                }
                NavigationLink(destination:
                    FoodDetailDescription()) {
                    HStack {
                        Image(systemName:"fork.knife")
                        Text("Food")
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

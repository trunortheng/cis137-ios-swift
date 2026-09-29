//
//  ContentView.swift
//  Lab 1: Using stack views
//  Author: Erick Ramos
//  Date: 9/26/26
//

import SwiftUI

struct ContentView: View {
    
    let dogNames: [String] = [
        "Airedale Terrier",
        "American Foxhound",
        "Dutch Shepherd",
        "Havanese",
        "Leonberger",
        "Mudi",
        "Norwegian Lundehund",
        "Pharaoh Hound",
        "Scottish Terrier",
        "Tosa"
    ]
    
    let descriptions: [String] = [
        "The Airedale stands among the world's most versatile dog breeds and has distinguished himself as hunter, athlete, and companion.",

        "American Foxhounds are good-natured, low-maintenance hounds who get on well with kids, dogs, even cats, but come with special considerations for prospective owners.",

        "The Dutch Shepherd is a lively, athletic, alert and intelligent breed, and has retained its herding instinct for which it was originally developed.",

        "Havanese, the only dog breed native to Cuba, are vivacious and sociable companions and are especially popular with American city dwellers.",

        "The Leonberger is a lush-coated giant of German origin. They have a gentle nature and serene patience and they relish the companionship of the whole family.",

        "The Mudi is an extremely versatile, intelligent, alert, agile, all-purpose Hungarian farm dog. The breed is a loyal protector of property and family members without being overly aggressive.",

        "From Norway’s rocky island of Vaeroy, the uniquely constructed Norwegian Lundehund is the only dog breed created for the job of puffin hunting. With puffins now a protected species, today’s Lundehund is a friendly, athletic companion.",

        "The Pharaoh Hound, ancient \"Blushing Dog\" of Malta, is an elegant but rugged sprinting hound bred to course small game over punishing terrain. Quick and tenacious on scent, these friendly, affectionate hounds settle down nicely at home.",

        "A solidly compact dog of vivid personality, the Scottish Terrier is an independent, confident companion of high spirits. Scotties have a dignified, almost-human character.",

        "The Tosa's temperament is marked by patience, composure, boldness and courage. He is normally a tranquil, quiet, and obedient dog, with a calm but vigilant demeanor."
    ]
    
    var dogDict: [String: String] {
        Dictionary(uniqueKeysWithValues: zip(dogNames, descriptions))
    }

    @State private var dog: String = ""
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        VStack {
                                    
            Text("Tap on a dog to see its description").font(.headline)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing:1) {
                    ForEach(dogNames, id: \.self) {
                        filename in Image(filename)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(8)
                            .onTapGesture {
                                dog = filename
                            }
                    }
                }
                .padding(.horizontal)
            }
            
            Divider()
            
            VStack {
                if let description = dogDict[dog] {
                    ScrollView{
                        Text(description)
                            .padding(.horizontal)
                    }
                }
                else {
                    Text("No Dog Selected. Go ahead and tap on a dog")
                }
            }
            .frame(height: 135)
            .frame(maxWidth: .infinity)

        }
        .padding()
    }
}

#Preview {
    ContentView()
}

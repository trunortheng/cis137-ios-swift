//
//  ContentView.swift
//  Lab 2: Grids in Swift UI
//  Author: Erick Ramos
//  Date: 10/20/26
//

import SwiftUI

let images = [
    "flower1",
    "flower2",
    "flower3",
    "flower4",
    "flower5",
    "flower6",
    "flower7",
    "flower8",
    "flower9",
    "flower10",
    "flower11",
    "flower12",
].shuffled()


struct ContentView:View {
    
    // Added this for adaptive sizing with breathing room for automatic centering
    let columns = [GridItem(.adaptive(minimum: 90, maximum: 120), spacing: 16)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing:8) {
                    Text("What the Flip!")
                        .font(.largeTitle)
                        .foregroundColor(.indigo)
                        .bold()
                        .padding(.top)
                // Simplified the LazyVGrid for a more consistent alignment
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(images, id: \.self) { im in
                            FlowerCards(content:im)
                                .aspectRatio(1, contentMode: .fit)
                        }
                    }.padding()
                }
            }
        }
    }
}


// Flower card view based on the lesson video
// Added the Rectangle shape to the FlowerCards View
// Implemented the logic to flip flop the opacity and hide the cards
// Modified the frame size to make wrap around the pictures better
struct FlowerCards: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.indigo.opacity(0.2), radius: 6, x:0, y:4)
            
            let shape = RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.indigo)
            
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: 3)
                .foregroundColor(.indigo)
            
            Image(content)
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(20)

            if isFaceUp {
                shape.opacity(0)
            }
            else {
                shape.opacity(1)
            }
        }
        //Added the gesture with animation for a better flip transition
         .onTapGesture {
             withAnimation(.easeInOut(duration: 0.2)) {
                 isFaceUp.toggle()
             }
        }
    }
}


// Reference code from the lesson video
// Helpful in implementing the switching of the face cards
struct CardView: View {
    var image: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.blue)
                .frame(width: 70.0, height: 70.0)
                .padding()
            
            Image(image).resizable().scaledToFit()
                .padding()
            
            if isFaceUp {
                shape.opacity(0)
            }
            else {
                shape.opacity(1)
            }
        }.padding()
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
        }
    }

#Preview {
    ContentView()
}

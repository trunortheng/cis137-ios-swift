//
//  ContentView.swift
//  Lab 3: MVVM Architecture and animation
//  Author: Erick Ramos
//  Date: 11/10/26
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel: FlowerMemoryGame
    
    var body: some View {
        ScrollView{
            Text("What the Flip!").font(.largeTitle).foregroundColor(.blue).bold()
            
            if !viewModel.cards.isEmpty && viewModel.cards.allSatisfy({ $0.isMatched }) {
                VStack(spacing: 8) {
                    Text("🎉 Game Over! 🎉")
                        .font(.title)
                        .bold()
                        .foregroundColor(.green)
                    Text("You found all the matches!")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .transition(.scale.combined(with: .opacity))
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum:100), spacing:1)]) {
                ForEach (viewModel.cards) { card in
                    FlowerCard(card: card).aspectRatio(1, contentMode: .fit).onTapGesture {
                        viewModel.choose(card)
                    }
                }
            }
            
            Button(action: {
                // Re-instantiates the game model, shuffling cards and resetting state
                viewModel.restart()
            }) {
            Label("Restart Game", systemImage: "arrow.clockwise")
                .font(.headline)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding(.top)
        }
    }
}

struct FlowerCard: View {
    var card: MemoryGame.Card
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            
            if card.isFaceUp || card.isMatched {
                shape.stroke(lineWidth: 3).foregroundColor(.blue)
                Image(card.content).resizable().scaledToFit().padding()
            }
            else {
                shape.fill().foregroundColor(.blue)
            }
        }
        .rotationEffect(.degrees(45-90))
        .animation(.easeInOut(duration: 0.5), value: card.isFaceUp)
        .transition(.asymmetric(insertion: .scale, removal: .slide))
        .opacity(card.isMatched ? 0 : 1) // Fades out smoothly when matched
        .animation(.easeInOut(duration: 0.5).delay(0.7), value: card.isMatched)
        .padding()
    }
}

#Preview {
    ContentView(viewModel: FlowerMemoryGame())
}

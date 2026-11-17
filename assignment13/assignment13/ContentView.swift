//
//  ContentView.swift
//  Assignment 13: Progress View
//  Author: Erick Ramos
//  Date: 11/11/26
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel: TechMemoryGame
    
    var body: some View {
        ZStack {
            ScrollView{
                VStack(spacing: 20){
                    Text("What the Flip!").font(.largeTitle).foregroundColor(.blue).bold().padding(.top, 8)
                    
                    ProgressView("Game Progress", value: viewModel.progress, total: 1.0)
                        .accentColor(.blue)
                        .padding(.horizontal)
                }
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum:100), spacing:1)]) {
                    ForEach (viewModel.cards) { card in
                        TechCard(card: card).aspectRatio(1, contentMode: .fit).onTapGesture {
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
            
            if !viewModel.cards.isEmpty && viewModel.cards.allSatisfy({ $0.isMatched }) {
                VStack(spacing: 8) {
                    Text("Game Over")
                        .font(.title)
                        .bold()
                        .foregroundColor(.blue)
                    Text("You found all the matches!")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(24)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                .shadow(radius: 10)
                .transition(.scale.combined(with: .opacity))
            }
        }
        .animation(.easeInOut(duration: 0.5), value: viewModel.cards.allSatisfy({ $0.isMatched }))
    }
}

struct TechCard: View {
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
//        .rotationEffect(.degrees(45-90))
        .animation(.easeInOut(duration: 0.5), value: card.isFaceUp)
        .transition(.asymmetric(insertion: .scale, removal: .slide))
        .opacity(card.isMatched ? 0 : 1) // Fades out smoothly when matched
        .animation(.easeInOut(duration: 0.5).delay(0.7), value: card.isMatched)
        .padding()
    }
}

#Preview {
    ContentView(viewModel: TechMemoryGame())
}


//
//  FlowerMemoryGame.swift
//  Lab 3: MVVM Architecture and animation
//  Author: Erick Ramos
//  Date: 11/10/26
//

import SwiftUI
import Combine

class FlowerMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame = CreateMemoryGame()
    
    
    static func CreateMemoryGame() -> MemoryGame {
        return MemoryGame(numberOfPairsOfCards: 6, contentFactory: makeContent)
    }
    
    nonisolated static func makeContent(index: Int) -> String {
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
        ]
        return images[index]
    }
    
    var cards: Array<MemoryGame.Card> {
        model.cards
    }
    
    var pairs: Int {
        model.numberOfPairs
    }
    
    func choose(_ card:MemoryGame.Card) {
        model.chooseCard(card)
    }
    
    func restart() {
            model = FlowerMemoryGame.CreateMemoryGame()
        }
}


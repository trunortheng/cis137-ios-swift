//
//  FlowerMemoryGame.swift
//  Assignment 13: Progress View
//  Author: Erick Ramos
//  Date: 11/11/26
//

import SwiftUI
import Combine

class TechMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame = CreateMemoryGame()
    
    
    static func CreateMemoryGame() -> MemoryGame {
        return MemoryGame(numberOfPairsOfCards: 6, contentFactory: makeContent)
    }
    
    nonisolated static func makeContent(index: Int) -> String {
        let images = [
            "tech_1",
            "tech_2",
            "tech_3",
            "tech_4",
            "tech_5",
            "tech_6",
            "tech_7",
            "tech_8",
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
            model = TechMemoryGame.CreateMemoryGame()
        }
    
    var progress: Double {
            model.progress
        }
}


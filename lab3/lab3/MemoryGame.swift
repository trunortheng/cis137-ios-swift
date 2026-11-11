//
//  MemoryGame.swift
//  Lab 3: MVVM Architecture and animation
//  Author: Erick Ramos
//  Date: 11/10/26
//

import Foundation

struct MemoryGame {
    private(set) var cards: Array<Card>
    private(set) var numberOfPairs: Int
    
    struct Card: Identifiable{
        var content: String
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var id: Int
    }
    
    private var indexOfTheOnlyFaceUpCard: Int? = nil

    mutating func chooseCard(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
                   !cards[chosenIndex].isFaceUp,
                   !cards[chosenIndex].isMatched {
                    
                    // Check if there is already one card face up (making this the second card chosen)
                    if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {
                        // Compare the two cards
                        if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                            cards[chosenIndex].isMatched = true
                            cards[potentialMatchIndex].isMatched = true
                        }
                        cards[chosenIndex].isFaceUp = true
                        indexOfTheOnlyFaceUpCard = nil // Reset tracker since pair attempt is complete
                    } else {
                        // If 0 or 2 cards were face up, turn all cards face down first
                        for index in cards.indices {
                            cards[index].isFaceUp = false
                        }
                        // Flip the newly chosen card face up and record it as the only face-up card
                        cards[chosenIndex].isFaceUp = true
                        indexOfTheOnlyFaceUpCard = chosenIndex
                    }
                }
    }
    
    init(numberOfPairsOfCards: Int, contentFactory: (Int) -> String) {
        cards = []
        numberOfPairs = numberOfPairsOfCards
        
        for index in 0..<numberOfPairsOfCards {
            let content = contentFactory(index)
            cards.append(Card(content: content, id: index*2))
            cards.append(Card(content: content, id: index*2+1))
        }
        cards.shuffle()
    }
}

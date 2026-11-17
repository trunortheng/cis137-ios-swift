//
//  MemoryGame.swift
//  Assignment 13: Progress View
//  Author: Erick Ramos
//  Date: 11/11/26
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

    // Variable to track game progress (ratio of matched cards)
    var progress: Double {
        guard !cards.isEmpty else { return 0 }
        let matchedCount = cards.filter { $0.isMatched }.count
        return Double(matchedCount) / Double(cards.count)
    }
    
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

//
//  Concentration.swift
//  Assignment1
//
//  Created by Adham Ragab on 2/10/20.
//  Copyright © 2020 Adham Ragab. All rights reserved.
//

import Foundation

class Concentration{
    
   private(set) var cards = [Card]()
   private var indexOfOneAndOnlyFaceUp : Int? {
        get {
           return  cards.indices.filter {cards[$0].isFaceUp}.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    
    func chooseCard(at index:Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUp , matchIndex != index {
                if cards[matchIndex] == cards[index]{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                    cards[index].isFaceUp = true
            }else {
                indexOfOneAndOnlyFaceUp = index
            }
        }
    }
    
    init(numberOfPairsOfCards:Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
    }
    
    func shuffleTheCards() {
        
    }
    
    
    
    
}

extension Collection {
    var oneAndOnly: Element?{
        return count == 1 ? first : nil
    }
}

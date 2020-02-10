//
//  Concentration.swift
//  Assignment1
//
//  Created by Adham Ragab on 2/10/20.
//  Copyright © 2020 Adham Ragab. All rights reserved.
//

import Foundation

class Concentration{
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUp : Int?
    
    
    func chooseCard(at index:Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUp , matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                    cards[index].isFaceUp = true
                    indexOfOneAndOnlyFaceUp = nil
            }else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
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

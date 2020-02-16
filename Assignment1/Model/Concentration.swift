//
//  Concentration.swift
//  Assignment1
//
//  Created by Adham Ragab on 2/10/20.
//  Copyright © 2020 Adham Ragab. All rights reserved.
//

import Foundation

protocol RefreshDisplayDelegate {
    func RefreshDisplay()
}

class Concentration{
    
    var delegate:RefreshDisplayDelegate?
    var themeChanged = false
    private(set) var score = 0
    private(set) var cards = [Card]()
    private(set) var flipCount = 0
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
    
    
    // MARK: - Choose Card
    
    func chooseCard(at index:Int){
        cards[index].SeenCount += 1
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUp , matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    
                }
                cards[index].isFaceUp = true
            }else {
                indexOfOneAndOnlyFaceUp = index
            }
            
            if cards[index].SeenCount > 2 {
                score -= 1
            }else if cards[index].isMatched && cards[index].SeenCount > 2 {
                score += 1
            }else if cards[index].isMatched && cards[index].SeenCount <= 2 {
                score += 2
            }
        }
        flipCount += 1
        if themeChanged == true {
            cards[index].isMatched = false
            cards[index].isFaceUp = false
            
        }
        
    }
    
   
    
    init(numberOfPairsOfCards:Int) {
         for _ in 0..<numberOfPairsOfCards {
                   let card = Card()
                   cards += [card,card]
               }
               cards.shuffle()
    }
    
    
    
}

extension Collection {
    var oneAndOnly: Element?{
        return count == 1 ? first : nil
    }
}

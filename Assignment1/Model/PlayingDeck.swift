//
//  PlayingDeck.swift
//  Assignment1
//
//  Created by Adham Ragab on 2/18/20.
//  Copyright © 2020 Adham Ragab. All rights reserved.
//

import Foundation



struct PlayingDeck{
    
    
    private(set) var score = 0
     var cards = [PlayingCard]()
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
    
    mutating func chooseCard(at index:Int){
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
     
        
    }
    
    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4random)
        }else{
            return nil
        }
    }
    
   
    
    init(numberOfPairsOfCards:Int) {
        var playingCardsArray = [PlayingCard]()
            for suit in PlayingCard.Suit.all {
                for rank in PlayingCard.Rank.all{
                    var card = PlayingCard()
                    card.suit = suit
                    card.rank = rank
                    playingCardsArray += [card]
                    
//                    print("\(card.rank) , \(card.suit)")
                }
                print("\n")
            }
        playingCardsArray.shuffle()
        for index in 0..<numberOfPairsOfCards {
            cards += [playingCardsArray[index],playingCardsArray[index]]
        }
        
        cards.shuffle()
        
        
                   
       
        print(cards)
              
    }
    
    
    
}



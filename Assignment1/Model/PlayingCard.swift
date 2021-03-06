//
//  PlayingCard.swift
//  Assignment1
//
//  Created by Adham Ragab on 2/18/20.
//  Copyright © 2020 Adham Ragab. All rights reserved.
//

import Foundation

struct PlayingCard : Hashable {
    
    
    
    static func ==(lhs:PlayingCard , rhs:PlayingCard) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher){
        hasher.combine(identifier)
    }
    private var identifier: Int
    var suit : Suit?
    var rank : Rank?
    var isFaceUp = false
    var isMatched = false
    var SeenCount = 0

    enum Suit : String {
        case spades = "♠️"
        case hearts = "♥️"
        case clubs  = "♣️"
        case diamonds = "♦️"

        static var all = [Suit.spades,.hearts,.clubs,.diamonds]
    }
    
    enum Rank  {
        case ace
        case face(String)
        case numeric(Int)

        var order : Int? {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13

            default:
                return nil
            }
        }

        static var all : [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10{
                allRanks.append(Rank.numeric(pips))
            }

            allRanks += [Rank.face("J"),.face("Q"),.face("K")]

            return allRanks
        }
        
      
        
      

    }
    private static var identiferFactory = 0
    
    private  static func getUniqueIdentifier() -> Int {
        identiferFactory += 1
        return identiferFactory
    }
    init() {
        self.identifier = PlayingCard.getUniqueIdentifier()
    }
}

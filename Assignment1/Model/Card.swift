//
//  Concentration.swift
//  Assignment1
//
//  Created by Adham Ragab on 2/10/20.
//  Copyright © 2020 Adham Ragab. All rights reserved.
//

import Foundation

struct Card {
   var isFaceUp = false
   var isMatched = false
   var identifier: Int
    
    static var identiferFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identiferFactory += 1
        return identiferFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    
}

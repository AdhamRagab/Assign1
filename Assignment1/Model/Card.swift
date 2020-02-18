//
//  Concentration.swift
//  Assignment1
//
//  Created by Adham Ragab on 2/10/20.
//  Copyright © 2020 Adham Ragab. All rights reserved.
//

import UIKit



struct Card : Hashable {
    
    static func ==(lhs:Card , rhs:Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher){
        hasher.combine(identifier)
    }
    

    
    var isFaceUp = false
    var isMatched = false
    var SeenCount = 0
    private var identifier: Int
    
    private static var identiferFactory = 0
    
   private  static func getUniqueIdentifier() -> Int {
        identiferFactory += 1
        return identiferFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    
    
}

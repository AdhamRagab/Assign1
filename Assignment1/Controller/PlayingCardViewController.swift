//
//  PlayingCardViewController.swift
//  Assignment1
//
//  Created by Adham Ragab on 2/18/20.
//  Copyright © 2020 Adham Ragab. All rights reserved.
//

import UIKit

class PlayingCardViewController: UIViewController {

    @IBOutlet var cards: [PlayingCardUIView]!
    
    var deck : PlayingDeck?
    var cardsCount:Int {
        return (cards.count/2)
    }
    
    @IBAction func Swiped(_ sender: UISwipeGestureRecognizer) {
        
        if let cardNumber = cards.firstIndex(of: sender.view as! PlayingCardUIView){
                 UIView.transition(with: cards[cardNumber], duration: 0.5,
                  options: .transitionFlipFromLeft ,
                 animations: {
                    sender.direction = [.left,.right]
                     self.deck?.chooseCard(at: cardNumber)
                     self.updateViewFromModel()
                 }, completion: nil)
                 
                 
             }else {
                 print("chosen card not in stack")
             }
    }
    
    
    
    private func updateViewFromModel () {
      
      guard let deck = deck else {return}
      if cards != nil {
          for index in cards.indices {
              let button = cards[index]
              let card  = deck.cards[index]
            print(cards.indices)
            
              if card.isFaceUp {
                button.isFaceUp = true
              }else{
                button.isFaceUp = false
                 
              }
          }
      }
      
      
     }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
           deck = PlayingDeck(numberOfPairsOfCards: cardsCount)
        
        for index in cards.indices {
            if let card = deck?.cards[index]{
                cards[index].rank = (card.rank?.order)!
                cards[index].suit = card.suit!.rawValue
            }
        }
    }
    

  
}

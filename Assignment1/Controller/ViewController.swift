//
//  ViewController.swift
//  Assignment1
//
//  Created by Adham Ragab on 2/9/20.
//  Copyright © 2020 Adham Ragab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func ResetPressed(_ sender: UIButton) {
        
    }
    
   private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairs)
   var numberOfPairs : Int {
        return (cards.count/2)+1
    }
    @IBOutlet private weak var flipsLabel: UILabel!
    @IBOutlet private var cards: [UIButton]!
   private var emojies = "🐻🦊🐹🐱🐶🐰"
   private(set) var flipCount = 0 {
        didSet{
            flipsLabel.text = "Flips: \(flipCount)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func touchCard(_ sender: UIButton) {
            flipCount += 1
        if let cardNumber = cards.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else {
            print("chosen card not in stack")
        }
    }
    
   private func updateViewFromModel () {
        for index in cards.indices {
            let button = cards[index]
            let card  = game.cards[index]
            
            if card.isFaceUp {
               button.setTitle(emoji(for: card), for: UIControl.State.normal)
               button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
               
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
                
            }
        }

    }
    
    private var emoji = [Card:String]()
    
   private  func emoji(for card:Card) -> String {
        
    if emoji[card] == nil {
            if emojies.count > 0 {
                let randomIndex = emojies.index(emojies.startIndex, offsetBy: emojies.count.arc4random)
                emoji[card] = String(emojies.remove(at: randomIndex))
            }
        }
        
    return emoji[card] ?? "?"
    }
    
}

extension Int {
    var arc4random: Int{
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else {
            return 0
        }
    }
    
}


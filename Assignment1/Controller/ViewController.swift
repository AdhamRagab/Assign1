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
    
    lazy var game = Concentration(numberOfPairsOfCards: (cards.count/2)+1)
    @IBOutlet weak var flipsLabel: UILabel!
    @IBOutlet var cards: [UIButton]!
    var emojies = ["🐻","🦊","🐹","🐱","🐶","🐰"]
    var flipCount = 0 {
        didSet{
            flipsLabel.text = "Flips: \(flipCount)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchCard(_ sender: UIButton) {
            flipCount += 1
        if let cardNumber = cards.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else {
            print("chosen card not in stack")
        }
    }
    
    func updateViewFromModel () {
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
    
    var emoji = [Int:String]()
    
    func emoji(for card:Card) -> String {
        
        if emoji[card.identifier] == nil {
            if emojies.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojies.count)))
            emoji[card.identifier] = emojies.remove(at: randomIndex)
            }
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
}


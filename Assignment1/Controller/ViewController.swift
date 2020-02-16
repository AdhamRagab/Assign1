//
//  ViewController.swift
//  Assignment1
//
//  Created by Adham Ragab on 2/9/20.
//  Copyright © 2020 Adham Ragab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     // MARK: - Outlets
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet private weak var flipsLabel: UILabel!
    @IBOutlet private var cards: [UIButton]!
    
     // MARK: - Reset Game
    @IBAction func ResetPressed(_ sender: UIButton) {
        CreateGame(usingEmojies: themes.Trees.rawValue)
    }
    
     // MARK: - Choose Theme
    
    @IBAction func ThemeChosen(_ sender: UIButton) {
        
     switch sender.currentTitle {
        case "Animals":
            CreateGame(usingEmojies: themes.Animals.rawValue)
        case "Sports":
            CreateGame(usingEmojies: themes.Sports.rawValue)
        case "Faces":
            CreateGame(usingEmojies: themes.Faces.rawValue)
        case "Trees":
            CreateGame(usingEmojies: themes.Trees.rawValue)
        default :
            break
        }
    }
     // MARK: - CreateGame
   private func CreateGame (usingEmojies theme:String){
        emojies = theme
        game = Concentration(numberOfPairsOfCards: numberOfPairs)
        flipsLabel.text = "Flips: \(game?.flipCount ?? 0)"
        ScoreLabel.text = "Score: \(game?.score ?? 0)"
        updateViewFromModel()
    }
    
   private var game :Concentration?
   var numberOfPairs : Int {
        return (cards.count/2)
    }
    
    var emojies = "🌵🎄🌳🌴☘️🍃"
    
     private enum themes : String {
        case Animals = "🐻🐹🦊🐱🐭🐶"
        case Sports = "🏀🏈🏐⚾️🎾⚽️"
        case Faces = "🥶😄😡😊🤩😍"
        case Trees = "🌵🎄🌳🌴☘️🍃"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        game = Concentration(numberOfPairsOfCards: numberOfPairs)
        game?.delegate = self as? RefreshDisplayDelegate
        
    }
    
         // MARK: - TouchCard()
        
 
    @IBAction private func touchCard(_ sender: UIButton) {
       
        updateViewFromModel()
        guard let game = game else {return}
        if let cardNumber = cards.firstIndex(of: sender){
            ScoreLabel.text = "Score: \(String(game.score))"
            UIView.transition(with: cards[cardNumber], duration: 0.5,
             options: .transitionFlipFromLeft ,
            animations: {
                self.game?.chooseCard(at: cardNumber)
                self.updateViewFromModel()
            }, completion: nil)
            
            
        }else {
            print("chosen card not in stack")
        }
        flipsLabel.text = "Flips: \(String(game.flipCount))"
      }
    
     // MARK: - UpdateViewFrModel()
    
   private func updateViewFromModel () {
    guard let game = game else {return}
    if cards != nil {
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
    
    
    

    }
    
     // MARK: - Emojies and Themes
    
    
    var theme : String? {
        didSet {
            
            switch theme {
                   case "Animals":
                    emojies = themes.Animals.rawValue
                   case "Sports":
                    emojies = themes.Sports.rawValue
                   case "Faces":
                    emojies = themes.Faces.rawValue
                   case "Trees":
                    emojies = themes.Trees.rawValue
                   default :
                       break
                   }
            emoji = [:]
            updateViewFromModel()
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
    
    func RefreshDisplay() {
      updateViewFromModel()
    }
    
}

 // MARK: - Arc4random extension

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


//
//  ViewController.swift
//  Assignment1
//
//  Created by Adham Ragab on 2/9/20.
//  Copyright © 2020 Adham Ragab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipsLabel: UILabel!
    @IBOutlet var cards: [UIButton]!
    var emojies = ["🐻","🦊","🐹","🐱","🐶","🐻","🦊","🐹","🐱","🐶","🐻","🦊","🐹","🐱","🐶","🐻","🦊","🐹","🐱","🐶"]
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
            flipCard(with: emojies[cardNumber], on: sender)
        }else {
            print("chosen card not in stack")
        }
    }
    
    func flipCard (with emoji:String , on button:UIButton){
        if button.currentTitle == emoji {
            button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            button.setTitle("", for: UIControl.State.normal)
        }else{
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.setTitle(emoji, for: UIControl.State.normal)
        }
    }
    
}


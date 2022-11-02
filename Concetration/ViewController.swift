//
//  ViewController.swift
//  Concetration
//
//  Created by admin on 31.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount: Int = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    //@IBOutlet var cardButtons: Array<UIButton>! - same thing
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var emojiChoices = ["❤️","🏀","🏀","🍒","💩","🐸","🐸","🐝","💩","❤️","🍒","🐝",]

    
    @IBAction func touchedCard(_ sender: UIButton) {
        flipCount += 1
        let cardNumber = cardButtons.index(of: sender)!
        flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
    }
    
    func flipCard(withEmoji emoji: String, on button:UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        } else {
            button.setTitle(emoji, for: .normal )
            button.backgroundColor = .white
        }
     }
}


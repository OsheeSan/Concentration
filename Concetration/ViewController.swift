//
//  ViewController.swift
//  Concetration
//
//  Created by admin on 31.10.2022.
//

import UIKit

class ViewController: UIViewController
{

    var flipCount: Int = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    //@IBOutlet var cardButtons: Array<UIButton>! - same thing
    
    
        
    var game: Concentration {
        Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    }
    
    lazy var game1 = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        
    @IBAction func touchedCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Error")
        }
    }
    
    func updateViewFromModel(){
//      for index in 0..<cardButtons.count {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: .normal )
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .orange
            }
        }
    }
    
    var emojiChoices = ["❤️","🏀","🏀","🍒","💩","🐸","🐸","🐝","💩","❤️","🍒","🐝",]

    
    func emoji(for card: Card) -> String {
        return "?"
    }
   
}


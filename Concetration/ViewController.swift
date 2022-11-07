//
//  ViewController.swift
//  Concetration
//
//  Created by admin on 31.10.2022.
//

import UIKit

class ViewController: UIViewController
{

    private(set) var flipCount: Int = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    //@IBOutlet var cardButtons: Array<UIButton>! - same thing
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private var numberOfPairsOfCards: Int {
//        get {
            return (cardButtons.count+1)/2
//        }
    }
        
    @IBAction private func touchedCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Error")
        }
    }
    
    private func updateViewFromModel(){
//      for index in 0..<cardButtons.count {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .orange
            }
        }
    }
    
    private var emojiChoices = ["❤️","🏀","🍒","💩","🐸","🐝","🙈","😒"]
    
//    var emoji = Dictionary<Int, String>()
    private var emoji = [Int: String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
//        if emoji[card.identifier] != nil{
//            return emoji[card.identifier]!
//        } else {
//            return "?"
//        }
        return emoji[card.identifier]! ?? "?"
    }
}
extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
        
    }
}


//
//  ViewController.swift
//  Concetration
//
//  Created by admin on 31.10.2022.
//

import UIKit

class ConcentrationViewController: UIViewController
{
    private(set) var flipCount: Int = 0 {
        didSet{
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel(){
        let attributes: [NSAttributedString.Key : Any] = [
            .strokeColor : UIColor.black,
            .strokeWidth : 5.0
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!{
        didSet{
            updateFlipCountLabel()
        }
    }
    
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
                button.backgroundColor = .lightGray
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .blue
            }
        }
    }
    
    var theme: String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
    
    private var emojiChoices = "❤️🏀🍒💩🐸🐝🙈😒"
    
//    var emoji = Dictionary<Int, String>()
    private var emoji = [Card: String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
//        if emoji[card.identifier] != nil{
//            return emoji[card.identifier]!
//        } else {
//            return "?"
//        }
        return emoji[card] ?? "?"
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


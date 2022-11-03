//
//  Concetration.swift
//  Concetration
//
//  Created by admin on 03.11.2022.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    func chooseCard(at index: Int){
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
        print(cards[index])
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
}

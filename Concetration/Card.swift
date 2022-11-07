//
//  Card.swift
//  Concetration
//
//  Created by admin on 03.11.2022.
//

import Foundation

struct Card
{
    public var isFaceUp = false
    public var isMatched = false
    public var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

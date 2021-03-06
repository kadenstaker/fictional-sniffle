//
//  Card.swift
//  FictionalSniffle
//
//  Created by Kaden Staker on 11/13/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

struct CardsDictionary: Decodable {
    let cards: [Card]
}

struct Card: Decodable {
    let suit: String
    let image: String // Note * taking in a string, not an image
    let value: String
    
    var rank: Int {
        if let integerValue = Int(value) {
            return integerValue
        }
        switch value {
        case "ACE":
            return 1
        case "JACK":
            return 11
        case "QUEEN":
            return 12
        case "KING":
            return 13
        default:
            return 0
        }
    }
}

extension Card: Comparable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank < rhs.rank
    }
}

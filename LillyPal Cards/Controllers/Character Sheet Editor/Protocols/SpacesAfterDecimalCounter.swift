//
//  SpacesAfterDecimalCounter.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/17/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import Foundation

protocol SpacesAfterDecimalCounter { }

extension SpacesAfterDecimalCounter {
    
    func spacesAfterDecimal(for value: Float) -> Int {
        let n = Decimal(string: "\(value)")!
        return max(-n.exponent, 0)
    }
}

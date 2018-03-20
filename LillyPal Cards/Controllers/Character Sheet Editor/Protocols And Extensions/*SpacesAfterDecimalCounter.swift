//
//  SpacesAfterDecimalCounter.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/17/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import Foundation

/// Types conforming to this protocol can call the `spacesAfterDecimal:for` method, which returns the number of spaces to the right of the decimal.
protocol SpacesAfterDecimalCounter { }

extension SpacesAfterDecimalCounter {
    
    /// This method returns the number of spaces to the right of the decimal in the passed value.
    /// - Parameter value: A number with a decimal and has characters to the right of that decimal to be counted.
    /// - Returns: The number of spaces to the right of the decimal.
    func spacesAfterDecimal(for value: Float) -> Int {
        let n = Decimal(string: "\(value)")!
        return max(-n.exponent, 0)
    }
}

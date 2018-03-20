//
//  FloatRounder.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/17/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import Foundation

/// Types conforming to this protocol can call the `round:off:toPlace` method and adjust the amount of digits visible in a Float.
protocol FloatRounder { }

extension FloatRounder {
    
    /// This method returns passed value rounded off to passed place. All floats have a decimal, but if 0 is specified as place the returned float will have '.0' ending that can be converted using `Int(exactly: double)` constructor.
    /// - Parameter value: This is the Float to be rounded.
    /// - Parameter toPlace: This is the digits to display left of the decimal.
    /// - Returns: A Float rounded to the specified decimal place.
    func round(off value: Float, toPlace: Float) -> Float {
        let multiplier = pow(10.0, toPlace)
        return Darwin.round(value * multiplier) / multiplier
    }
}

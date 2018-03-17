//
//  FloatRounder.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/17/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import Foundation

protocol FloatRounder { }

extension FloatRounder {
    
    func round(off value: Float, toPlace: Float) -> Float {
        let multiplier = pow(10.0, toPlace)
        return Darwin.round(value * multiplier) / multiplier
    }
}

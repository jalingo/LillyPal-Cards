//
//  CharacterHealthAdjuster.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/18/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

// MARK: Protocol

/// Types conforming to this protocol can call the `adjust:from` method and update `current?.health` and `characterHealthField.text` properties.
protocol CharacterHealthAdjuster: FloatRounder { }

// MARK: - Extension

extension CharacterHealthAdjuster where Self: CharacterSheetVC {
    
    /// This void method updates `current?.health` and `characterHealthField.text` properties based on slider parameter.
    /// - Parameter slider: This argument's value property will be used to make adjustments to character model and views.
    func adjust(from slider: UISlider) {
        guard let roundedValue = Int(exactly: round(off: slider.value, toPlace: 0)),
            let current = current else { return }
        
        characterHealthField.text = "\(roundedValue) / \(current.maxHealth)"
        self.current?.health = roundedValue
    }
}

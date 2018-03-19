//
//  CharacterHealthAdjuster.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/18/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

protocol CharacterHealthAdjuster { }

extension CharacterHealthAdjuster where Self: CharacterSheetVC {
    
    // !!
    func adjust(from slider: UISlider) {
        guard let current = current,
            let roundedValue = Int(exactly: round(off: slider.value, toPlace: 0)) else { return }
        
        characterHealthField.text = "\(roundedValue) / \(current.maxHealth)"
        self.current?.health = roundedValue
    }
}

//
//  CharacterAttributeChanger.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import Foundation

// MARK: Protocol

/// Types conforming to this protocol can call the `change:attribute:to` method, and adjust `current` property stats and attributes.
protocol CharacterAttributeChanger { }

// MARK: - Extension

extension CharacterAttributeChanger where Self: CharacterSheetVC {
    
    /// This void method sets passed `attribute` to passed `value` in the `current` property. This will also update health and then decorate views.
    /// - Parameter attribute: This argument specifies which `current` property will be modified.
    /// - Parameter value: This number should overwrite the previous value.
    func change(attribute: CharacterAttribute, to value: Double) {
        guard let value = Int(exactly: value) else { return }
        
        switch attribute {
        case .body:   current?.body = value
        case .mind:   current?.mind = value
        case .social: current?.social = value
        }
        
        if let max = current?.maxHealth { current?.health = max }
        decorate()
    }
}

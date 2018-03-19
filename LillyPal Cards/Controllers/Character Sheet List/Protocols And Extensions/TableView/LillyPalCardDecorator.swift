//
//  LillyPalCalculator.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

// MARK: Protocol

/// Conforming types to this protocol can call `decorateCell` method when `CharacterController.current` didSet.
protocol LillyPalCardDecorator { }

extension LillyPalCardDecorator where Self: LillyPalCardTVC {
    
    /// This void method matches `charName` and `charPortrait` to `current`. Then updates attributes, stats and health labels.
    func decorateCell() {
        charName.text = current?.name
        charPortrait.image = current?.portrait
        
        updateAttributes()
        updateStats()
        updateHealth()
    }
    
    /// This fileprivate, void method matches `charBodyLabel`, `charMindLabel` & `charSocialLabel` to `current` property.
    fileprivate func updateAttributes() {
        guard let current = current else { return }
        
        charBodyLabel.text = "\(current.body)"
        charMindLabel.text = "\(current.mind)"
        charSocialLabel.text = "\(current.social)"
    }

    /// This fileprivate, void method matches `charStrengthLabel`, `charIntelligenceLabel`, `charCharismaLabel`, `charPerceptionLabel` & `charReactionLabel` to `current` property.
    fileprivate func updateStats() {
        guard let current = current else { return }

        charStrengthLabel.text = "\(current.strength)"
        charIntelligenceLabel.text = "\(current.intelligence)"
        charCharismaLabel.text = "\(current.charisma)"
        charPerceptionLabel.text = "\(current.perception)"
        charReactionLabel.text = "\(current.reaction)"
    }
    
    /// This fileprivate, void method matches `charHealthLabel` to `current` property.
    fileprivate func updateHealth() {
        guard let current = current else { return }
        charHealthLabel.text = "\(current.health) / \(current.maxHealth)"
    }
}

extension LillyPalCardDecorator where Self: LillyPalCardSlimTVC {
    
    /// This void method matches `characterName` and `characterPortrait` to `current`.
    func decorateCell() {
        guard let current = current else { return }
        
        characterName.text = current.name
        characterPortrait.image = current.portrait
    }
}

//
//  LillyPalCalculator.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import Foundation

protocol LillyPalCardDecorator { }

extension LillyPalCardDecorator where Self: LillyPalCardTVC {
    
    func updateViews() {
        charName.text = current?.name
        charPortrait.image = current?.portrait
        
        updateAttributes()
        updateStats()
        updateHealth()
    }
    
    fileprivate func updateAttributes() {
        guard let current = current else { return }
        
        charBodyLabel.text = "\(current.body)"
        charMindLabel.text = "\(current.mind)"
        charSocialLabel.text = "\(current.social)"
    }
    
    fileprivate func updateStats() {
        guard let current = current else { return }

        charStrengthLabel.text = "\(current.strength)"
        charIntelligenceLabel.text = "\(current.intelligence)"
        charCharismaLabel.text = "\(current.charisma)"
        charPerceptionLabel.text = "\(current.perception)"
        charReactionLabel.text = "\(current.reaction)"
    }
    
    fileprivate func updateHealth() {
        guard let current = current else { return }
        charHealthLabel.text = "\(current.health) / \(current.maxHealth)"
    }
}

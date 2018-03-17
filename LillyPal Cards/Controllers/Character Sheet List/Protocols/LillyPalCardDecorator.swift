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
    
    func calculateStats() {
        charName.text = current?.name
        charPortrait.image = current?.portrait
        
        guard let current = current else { return }
        
        charBodyLabel.text = "\(current.body)"
        charMindLabel.text = "\(current.mind)"
        charSocialLabel.text = "\(current.social)"
        
        charStrengthLabel.text = "\(current.strength)"
        charIntelligenceLabel.text = "\(current.intelligence)"
        charCharismaLabel.text = "\(current.charisma)"
        
        charPerceptionLabel.text = "\(current.perception)"
        charReactionLabel.text = "\(current.reaction)"
        
        charHealthLabel.text = "\(current.health) / \(current.maxHealth)"
    }
}

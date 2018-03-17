//
//  LillyPalCalculator.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import Foundation

protocol LillyPalCalculator { }

extension LillyPalCalculator where Self: LillyPalCardTVC {
    
    func calculateStats() {
        charName.text = current?.name
        charPortrait.image = current?.portrait
        
        guard let current = current else { return }
        
        charBodyLabel.text = "\(current.body)"
        charMindLabel.text = "\(current.mind)"
        charSocialLabel.text = "\(current.social)"
        
        charStrengthLabel.text = "\(current.body + current.body)"
        charIntelligenceLabel.text = "\(current.mind + current.mind)"
        charCharismaLabel.text = "\(current.social + current.social)"
        
        charPerceptionLabel.text = "\(current.mind + current.social)"
        charReactionLabel.text = "\(current.body + current.mind)"
        
        charHealthLabel.text = "\(current.health) / \(current.body + current.mind + current.social)"
    }
}

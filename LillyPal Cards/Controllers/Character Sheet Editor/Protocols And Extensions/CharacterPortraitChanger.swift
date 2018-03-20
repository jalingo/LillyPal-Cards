//
//  CharacterPortraitChanger.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

// MARK: Global

/// This global constant stores all available character portraits.
let characterPortraits = [#imageLiteral(resourceName: "cool_kitty_cat"), #imageLiteral(resourceName: "Quick_rick"), #imageLiteral(resourceName: "steve"), #imageLiteral(resourceName: "Wakil_kepala_yavno"), #imageLiteral(resourceName: "bully_boy_bob")]

// MARK: - Protocol

/// Types conforming to this protocol can call the `nextPortrait` and `previousPortrait` methods, in order to cycle through various portrait presets.
protocol CharacterPortraitChanger { }

// MARK: - Extension

extension CharacterPortraitChanger where Self: CharacterSheetVC {
    
    /// This method returns the next UIImage in `characterPortraits` for use as a character.portrait property.
    func nextPortrait() -> UIImage {
        guard let img = self.characterPortrait.image, let current = characterPortraits.index(of: img) else { return #imageLiteral(resourceName: "cool_kitty_cat") }

        if current + 1 < characterPortraits.count - 1 {
            return characterPortraits[current + 1]
        } else {
            return characterPortraits.first ?? #imageLiteral(resourceName: "cool_kitty_cat")
        }
    }
    
    /// This method returns the previous UIImage in `characterPortraits` for use as a character.portrait property.
    func previousPortrait() -> UIImage {
        guard let img = self.characterPortrait.image, let current = characterPortraits.index(of: img) else { return #imageLiteral(resourceName: "cool_kitty_cat") }

        if current - 1 > -1 {
            return characterPortraits[current - 1]
        } else {
            return characterPortraits.last ?? #imageLiteral(resourceName: "cool_kitty_cat")
        }
    }
}

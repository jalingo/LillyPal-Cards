//
//  CharacterPortraitChanger.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

let characterPortraits = [#imageLiteral(resourceName: "cool_kitty_cat"), #imageLiteral(resourceName: "Quick_rick"), #imageLiteral(resourceName: "steve"), #imageLiteral(resourceName: "Wakil_kepala_yavno"), #imageLiteral(resourceName: "bully_boy_bob")]

protocol CharacterPortraitChanger { }

extension CharacterPortraitChanger where Self: CharacterSheetVC {
    
    // !!
    func nextPortrait() -> UIImage {
        guard let img = self.characterPortrait.image, let current = characterPortraits.index(of: img) else { return #imageLiteral(resourceName: "cool_kitty_cat") }

        if current + 1 < characterPortraits.count - 1 {
            return characterPortraits[current + 1]
        } else {
            return characterPortraits.first ?? #imageLiteral(resourceName: "cool_kitty_cat")
        }
    }
    
    // !!
    func previousPortrait() -> UIImage {
        guard let img = self.characterPortrait.image, let current = characterPortraits.index(of: img) else { return #imageLiteral(resourceName: "cool_kitty_cat") }

        if current - 1 > -1 {
            return characterPortraits[current - 1]
        } else {
            return characterPortraits.last ?? #imageLiteral(resourceName: "cool_kitty_cat")
        }
    }
}

//
//  Strings.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/17/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

// MARK: Structs

/// This struct contains static constants matching respective identifiers in the main storyboard.
struct StoryBoardIdentifier {

    /// This static, constant property contains the storyboard identifier for standard cells in `CardDeckTV`.
    static let lillyPalCell = "LillyPal_Cell"
    
    /// This static, constant property contains the storyboard identifier for cells being edited in `CardDeckTV`.
    static let lillyPalSlimCell = "LillyPal_SlimCell"
    
    /// This static, constant property contains the storyboard identifier for segue from `MainViewController` to `CharacterSheetVC`.
    static let segueToCharacterEditor = "toCharacterSheet"
}

/// This struct contains static constants used as default values.
struct Defaults {
    
    /// This static, constant property contains the default name for LillyPal characters.
    static let characterName = "Default Name"
}

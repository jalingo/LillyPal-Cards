//
//  LillyPal.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit
import CloudKit

// MARK: Struct

/// This struct stores by value a Character's core attributes and information.
struct LillyPal: Character {
    
    // MARK: - Properties

    // MARK: - Properties: Character
    
    /// This property contains the LillyPal's full name.
    var name = Defaults.characterName
    
    /// This property contains the LillyPal's body attribute.
    var body = 1
    
    /// This property contains the LillyPal's mind attribute.
    var mind = 1
    
    /// This property contains the LillyPal's social attribute.
    var social = 1
    
    /// This property contains the LillyPal's current health (**NOT** to be confused with max health).
    var health = 3
    
    /// This property contains the LillyPal's portrait image..
    var portrait = #imageLiteral(resourceName: "cool_kitty_cat")
    
    // MARK: - Properties: MCRecordable
    
    var recordID = CKRecordID(recordName: "created \(Date().timeIntervalSince1970)")
}

// MARK: - Extensions

extension LillyPal: CustomStringConvertible {
    
    /// A textual representation of this instance.
    var description: String { return "\(portrait) \(name)" }
}

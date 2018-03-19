//
//  Character.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/15/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

// MARK: - Protocol: Character

/// This protocol is an abstraction of the LillyPal class, representing the characters whose stats will be saved and calculated by the app for use in the Lillypalooza pen & paper rpg. Characters can range from static npc's to the players' own dynamic characters.
protocol Character {
    
    /// This property contains the Character's full name.
    var name: String { get set }
    
    /// This property contains the Character's body attribute value.
    var body: Int { get set }
    
    /// This property contains the Character's mind attribute value.
    var mind: Int { get set }
    
    /// This property contains the Character's social attribute value.
    var social: Int { get set }
    
    /// This property contains the Character's current health value (**NOT** to be confused with `maxHealth`).
    var health: Int { get set }
    
    /// This property contains the Character's portrait image.
    var portrait: UIImage { get set }
}

// MARK: - Extension: Character

extension Character {

    /// This read-only, computed property returns the Character's max health value (**NOT** to be confused with the Character's current `health`). This stat is calculated using the Character's attributes: mind + body + social = max health.
    var maxHealth: Int { return mind + body + social }
    
    /// This read-only, computed property returns the Character's strength value. This stat is calculated using the Character's attributes: body x 2 = strength.
    var strength: Int { return body + body }
    
    /// This read-only, computed property returns the Character's intelligence value. This stat is calculated using the Character's attributes: mind x 2 = intelligence.
    var intelligence: Int { return mind + mind }
    
    /// This read-only, computed property returns the Character's charisma value. This stat is calculated using the Character's attributes: social x 2 = charisma.
    var charisma: Int { return social + social }
    
    /// This read-only, computed property returns the Character's perception value. This stat is calculated using the Character's attributes: mind + social = perception.
    var perception: Int { return mind + social }
    
    /// This read-only, computed property returns the Character's reaction value. This stat is calculated using the Character's attributes: body + mind = reaction.
    var reaction: Int { return body + mind }
}

//
//  Character.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/15/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

// MARK: - Enums

// MARK: - Enum: CharacterAttribute

// !!
enum CharacterAttribute { case body, mind, social }

// MARK: - Protocols

// MARK: - Protocol: CharacterController

// !!
protocol CharacterController: AnyObject {
    var current: Character? { get set }
}

// MARK: - Protocol: Character

protocol Character {
    
    var name: String { get set }
    
    var body: Int { get set }
    
    var mind: Int { get set }
    
    var social: Int { get set }
    
    var health: Int { get set }
    
    var portrait: UIImage { get set }
}

// MARK: - Extension: Character

extension Character {
    
    var maxHealth: Int { return mind + body + social }
    
    var strength: Int { return body + body }
    
    var intelligence: Int { return mind + mind }
    
    var charisma: Int { return social + social }
    
    var perception: Int { return mind + social }
    
    var reaction: Int { return body + mind }
}

//
//  Character.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/15/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

enum CharacterAttribute { case body, mind, social }

protocol Character {
    
    var name: String { get set }
    
    var body: Int { get set }
    
    var mind: Int { get set }
    
    var social: Int { get set }
    
    var health: Int { get set }
    
    var portrait: UIImage { get set }
}

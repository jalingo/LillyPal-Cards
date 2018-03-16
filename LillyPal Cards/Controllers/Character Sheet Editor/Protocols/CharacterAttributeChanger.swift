//
//  CharacterAttributeChanger.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import Foundation

protocol CharacterAttributeChanger { }

extension CharacterAttributeChanger where Self: CharacterSheetVC {
    
    func change(attribute: CharacterAttribute, to value: Double) {
        guard let value = Int(exactly: value) else { return }
        
        switch attribute {
        case .body:   current?.body = value
        case .mind:   current?.mind = value
        case .social: current?.social = value
        }
        
        decorateAttributeFields()
    }
}

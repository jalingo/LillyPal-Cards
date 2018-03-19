//
//  CharacterController.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/19/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

// MARK: - Protocol

/// Conforming classes to this protocol contain a character to be presented or edited.
protocol CharacterController: AnyObject {
    
    /// This optional property contains the character being presented or edited, when not nil.
    var current: Character? { get set }
}

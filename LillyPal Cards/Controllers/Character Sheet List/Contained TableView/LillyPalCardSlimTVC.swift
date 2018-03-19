//
//  LillyPalCardSlimTVC.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/17/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

/// This sub-class of `UITableViewCell` is dequeued by `CardDeckTV` when it's `isEditing` property is set to `true` and it has to present characters.
class LillyPalCardSlimTVC: UITableViewCell, CharacterController, LillyPalCardDecorator {
    
    // MARK: - Properties
    
    // MARK: - Properties: CharacterCell
    
    /// This optional property contains the character being presented or edited, when not nil. When set, this property calls the `decorateCell` method.
    var current: Character? {
        didSet { decorateCell() }
    }
    
    // MARK: - Properties: IBOutlets
    
    /// This IBOutlet property links to the `UIImageView` displaying `current?.portrait` image.
    @IBOutlet weak var characterPortrait: UIImageView!
    
    /// This IBOutlet property links to the `UILabel` displaying `current?.name` string.
    @IBOutlet weak var characterName: UILabel!
}

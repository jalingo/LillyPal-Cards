//
//  LillyPalCardTVC.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

// MARK: Class

/// This sub-class of `UITableViewCell` is dequeued by `CardDeckTV` when it's `isEditing` property is set to `false` and it has to present characters.
class LillyPalCardTVC: UITableViewCell, CharacterController, LillyPalCardDecorator {

    // MARK: - Properties
    
    // MARK: - Properties: CharacterCell

    /// This optional property contains the character being presented or edited, when not nil. When set, this property calls the `decorateCell` method.
    var current: Character? {
        didSet { decorateCell() }
    }
    
    // MARK: - Properties: IBOutlets
    
    /// This IBOutlet property links to the `UILabel` displaying `current?.name` string.
    @IBOutlet weak var charName: UILabel!
    
    /// This IBOutlet property links to the `UIImageView` displaying `current?.portrait` image.
    @IBOutlet weak var charPortrait: UIImageView!
    
    /// This IBOutlet property links to the `UILabel` displaying `current?.body` string.
    @IBOutlet weak var charBodyLabel: UILabel!
    
    /// This IBOutlet property links to the `UILabel` displaying `current?.mind` string.
    @IBOutlet weak var charMindLabel: UILabel!
    
    /// This IBOutlet property links to the `UILabel` displaying `current?.social` string.
    @IBOutlet weak var charSocialLabel: UILabel!
    
    /// This IBOutlet property links to the `UILabel` displaying `current?.strength` string.
    @IBOutlet weak var charStrengthLabel: UILabel!
    
    /// This IBOutlet property links to the `UILabel` displaying `current?.intelligence` string.
    @IBOutlet weak var charIntelligenceLabel: UILabel!
    
    /// This IBOutlet property links to the `UILabel` displaying `current?.charisma` string.
    @IBOutlet weak var charCharismaLabel: UILabel!
    
    /// This IBOutlet property links to the `UILabel` displaying `current?.perception` string.
    @IBOutlet weak var charPerceptionLabel: UILabel!
    
    /// This IBOutlet property links to the `UILabel` displaying `current?.reaction` string.
    @IBOutlet weak var charReactionLabel: UILabel!
    
    /// This IBOutlet property links to the `UILabel` displaying `current?.health` string.
    @IBOutlet weak var charHealthLabel: UILabel!
}

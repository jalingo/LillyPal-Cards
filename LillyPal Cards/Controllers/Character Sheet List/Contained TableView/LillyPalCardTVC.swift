//
//  LillyPalCardTVC.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

class LillyPalCardTVC: UITableViewCell, LillyPalCardDecorator, CharacterController {

    // MARK: - Properties
    
    // MARK: - Properties: CharacterCell

    var current: Character? {
        didSet { updateViews() }
    }
    
    // MARK: - Properties: IBOutlets
    
    @IBOutlet weak var charName: UILabel!
    
    @IBOutlet weak var charPortrait: UIImageView!
    
    @IBOutlet weak var charBodyLabel: UILabel!
    
    @IBOutlet weak var charMindLabel: UILabel!
    
    @IBOutlet weak var charSocialLabel: UILabel!
    
    @IBOutlet weak var charStrengthLabel: UILabel!
    
    @IBOutlet weak var charIntelligenceLabel: UILabel!
    
    @IBOutlet weak var charCharismaLabel: UILabel!
    
    @IBOutlet weak var charPerceptionLabel: UILabel!
    
    @IBOutlet weak var charReactionLabel: UILabel!
    
    @IBOutlet weak var charHealthLabel: UILabel!
}

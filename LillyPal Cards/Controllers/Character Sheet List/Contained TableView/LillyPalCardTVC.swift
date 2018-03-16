//
//  LillyPalCardTVC.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

class LillyPalCardTVC: UITableViewCell, LillyPalCalculator {

    // MARK: - Properties

    var current: Character?
    
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
    
    // MARK: - Functions
    
    // MARK: - Functions: UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        calculateStats()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

enum PlayerStats { case strength, intelligence, charisma, perception, reation, maxHealth }

protocol LillyPalCalculator { }

extension LillyPalCalculator where Self: LillyPalCardTVC {
    
    func calculateStats() {
        charName.text = current?.name
        charPortrait.image = current?.portrait
        
        guard let current = current else { return }
        
        charBodyLabel.text = "\(current.body)"
        charMindLabel.text = "\(current.mind)"
        charSocialLabel.text = "\(current.social)"
        
        charStrengthLabel.text = "\(current.body + current.body)"
        charIntelligenceLabel.text = "\(current.mind + current.mind)"
        charCharismaLabel.text = "\(current.social + current.social)"

        charPerceptionLabel.text = "\(current.mind + current.social)"
        charReactionLabel.text = "\(current.body + current.mind)"
        
        charHealthLabel.text = "\(current.health) / \(current.body + current.mind + current.social)"
    }
}

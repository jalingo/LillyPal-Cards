//
//  LillyPalCardSlimTVC.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/17/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

class LillyPalCardSlimTVC: UITableViewCell {
    
    // MARK: - Properties
    
    var current: Character? {
        didSet { decorateCell() }
    }
    
    // MARK: - Properties: IBOutlets
    
    @IBOutlet weak var characterPortrait: UIImageView!
    
    @IBOutlet weak var characterName: UILabel!
    
    // MARK: - Functions
    
    func decorateCell() {
        guard let current = current else { return }
        
        characterName.text = current.name
        characterPortrait.image = current.portrait
    }
}

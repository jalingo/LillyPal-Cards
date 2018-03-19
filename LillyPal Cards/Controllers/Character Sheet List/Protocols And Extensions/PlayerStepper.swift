//
//  PlayerStepper.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/18/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

protocol PlayerStepper { }

extension PlayerStepper where Self: MainViewController {
    
    // !!
    func playersChanged(by sender: UIStepper) {
        let total = Int(exactly: sender.value) ?? 0
        
        let count: Int
        count = total - players.count
        
        guard count != 0 else { players = []; return }
        
        if count > 0 {
            for _ in 1...count { players.append(LillyPal()) }
        } else {
            for _ in 1...abs(count) { players.removeLast() }
        }
    }
}

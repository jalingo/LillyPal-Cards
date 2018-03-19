//
//  PlayerStepper.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/18/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

/// Conforming types to this protocol can call `playersChanged:sender` method when a USER triggers an `UIStepper` through an IBAction property.
protocol PlayerStepper { }

extension PlayerStepper where Self: MainViewController {
    
    /// This void method changes the players stored in `MainViewController.players` by either appending a new player to the end (when sender has stepped up the number of players) or removing the last player (when sender has stepped down the number of players).
    /// - Parameter sender: The UIStepper passed through to IBAction calling this method.
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

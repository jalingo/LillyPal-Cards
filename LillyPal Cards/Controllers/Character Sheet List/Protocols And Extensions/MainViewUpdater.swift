//
//  MainViewUpdater.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/18/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

// MARK: Protocol

/// Conforming types to this protocol can call `updateViews` method when `MainViewController.players` didSet.
protocol MainViewUpdater { }

// MARK: - Extensions

extension MainViewUpdater where Self: MainViewController {
    
    /// This void method posts a `playerChangeNotification` and updates the `numberOfPlayersField` and `numberOfPlayersStepper` properties.
    func updateViews() {
        NotificationCenter.default.post(name: playerChangeNotification, object: nil)
        
        numberOfPlayersField.text = "\(players.count)"
        numberOfPlayersStepper.value = Double(exactly: players.count) ?? 0.0
    }
}

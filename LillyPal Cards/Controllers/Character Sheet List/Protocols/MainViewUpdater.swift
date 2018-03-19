//
//  MainViewUpdater.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/18/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

protocol MainViewUpdater { }

extension MainViewUpdater where Self: MainViewController {
    
    // !!
    func updateViews() {
        NotificationCenter.default.post(name: playerChangeNotification, object: nil)
        numberOfPlayersField.text = "\(players.count)"
        numberOfPlayersStepper.value = Double(exactly: players.count) ?? 0.0
    }
}

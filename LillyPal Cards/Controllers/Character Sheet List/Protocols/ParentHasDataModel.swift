//
//  ParentHasDataModel.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import Foundation

let playerChangeNotification = Notification.Name("numberOfPlayersChanged")

protocol ParentHasDataModel { }

extension ParentHasDataModel where Self: CardDeckTVC {
    
    // !!
    func listenForDataModelChanges() {
        NotificationCenter.default.addObserver(forName: playerChangeNotification, object: nil, queue: nil) { _ in
            self.tableView.reloadData()
        }
    }
}

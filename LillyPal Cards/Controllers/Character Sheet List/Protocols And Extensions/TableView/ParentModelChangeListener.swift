//
//  ParentHasDataModel.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

// MARK: Global Constant

/// This global constant stores notification name for a parent to post and a child to observe when parent's data model has changed.
let playerChangeNotification = Notification.Name("numberOfPlayersChanged")

// MARK: - Protocol

/// Conforming types to this protocol can call the `listenForDtaModelChangesInParent` method, which reloads tableView when `playerChangeNotification` is observed.
protocol ParentModelChangeListener { }

// MARK: - Extensions

extension ParentModelChangeListener where Self: UITableViewController {
    
    /// This void method configures an observer in default notification center that calls `tableview.reloadData()` when `playerChangeNotification` is observed.
    func listenForDataModelChangesInParent() {
        NotificationCenter.default.addObserver(forName: playerChangeNotification, object: nil, queue: nil) { _ in
            self.tableView.reloadData()
        }
    }
}

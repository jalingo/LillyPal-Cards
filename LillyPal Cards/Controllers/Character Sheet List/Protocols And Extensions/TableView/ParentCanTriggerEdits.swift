//
//  ParentCanTriggerEdits.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

let playerListEditNotification = Notification.Name("editButtonTapped")

protocol ParentCanTriggerEdits { }

extension ParentCanTriggerEdits where Self: UITableViewController {
    
    // !!
    func listenForEditButtonTapped() {
        NotificationCenter.default.addObserver(forName: playerListEditNotification, object: nil, queue: nil) { _ in
            self.isEditing = !self.isEditing
        }
    }
}

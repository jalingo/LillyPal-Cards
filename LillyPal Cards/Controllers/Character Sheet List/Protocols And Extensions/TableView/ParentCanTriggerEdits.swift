//
//  ParentCanTriggerEdits.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

/// This global constant stores notification name for a parent to post and a child to observe when parent's edit button has changed and child table view needs to alternate `isEditing` property.
let editButtonTapped = Notification.Name("editButtonTapped")

/// Conforming types to this protocol can call the `listenForEditButtonTapped` method, which alternates `isEditing` property when `editButtonTapped` is observed.
protocol ParentCanTriggerEdits { }

extension ParentCanTriggerEdits where Self: UITableViewController {
    
    // This void method configures an observer in default notification center that sets `isEditing` property to it's opposite value.
    func listenForEditButtonTapped() {
        NotificationCenter.default.addObserver(forName: editButtonTapped, object: nil, queue: nil) { _ in
            self.isEditing = !self.isEditing
        }
    }
}

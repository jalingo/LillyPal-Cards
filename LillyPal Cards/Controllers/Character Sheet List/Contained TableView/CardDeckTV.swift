//
//  CardDeckTVC.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/14/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

/// This sub class of `UITableViewController` is contained in `MainViewController` and displays the list of character's stored in it's parent's `players` property.
class CardDeckTV: UITableViewController, ParentModelChangeListener, ParentCanTriggerEdits {

    // MARK: - Properties
    
    /// This override of `isEditing` property allows for table view to `reloadData` when set.
    override var isEditing: Bool {
        didSet { self.tableView.reloadData() }
    }
    
    // MARK: - Functions
    
    // MARK: - Functions: UIViewController
    
    /// This override of `viewDidLoad` method listens for changes at the `MainViewController.players` property and for USER interaction at the `MainViewController.editButtonTapped:sender` method.
    override func viewDidLoad() {
        super.viewDidLoad()

        listenForDataModelChangesInParent()
        listenForEditButtonTapped()
    }
}

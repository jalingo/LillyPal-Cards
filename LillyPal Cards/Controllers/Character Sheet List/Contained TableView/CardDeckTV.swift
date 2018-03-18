//
//  CardDeckTVC.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/14/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

class CardDeckTV: UITableViewController, ParentHasDataModel, ParentCanTriggerEdits {

    // MARK: - Properties
    
    override var isEditing: Bool {
        didSet { self.tableView.reloadData() }
    }
    
    // MARK: - Functions
    
    // MARK: - Functions: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listenForDataModelChanges()
        listenForEditButtonTapped()
    }
}

//
//  CardDeckTVC.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/14/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

class CardDeckTVC: UITableViewController, ParentHasDataModel, ParentCanTriggerEdits {

    // MARK: - Properties
    
    // MARK: - Functions
    
    // MARK: - Functions: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listenForDataModelChanges()
        listenForEditButtonTapped()
    }
}

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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
print(" prep happened from TableViewController \(segue.destination)")
    }
}

let playerChangeNotification = Notification.Name("numberOfPlayersChanged")
let playerListEditNotification = Notification.Name("editButtonTapped")

protocol ParentCanTriggerEdits { }

extension ParentCanTriggerEdits where Self: UITableViewController {
    func listenForEditButtonTapped() {
        NotificationCenter.default.addObserver(forName: playerListEditNotification, object: nil, queue: nil) { _ in
            self.isEditing = !self.isEditing
        }
    }
}

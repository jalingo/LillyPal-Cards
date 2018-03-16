//
//  MainViewController.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/14/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

let playerChangeNotification = Notification.Name("numberOfPlayersChanged")

class MainViewController: UIViewController, MainViewDecorator {

    // MARK: - Properties
    
    var numberOfPlayers = 0 {
        didSet {
            NotificationCenter.default.post(name: playerChangeNotification, object: numberOfPlayers)
            numberOfPlayersField.text = "\(numberOfPlayers)"
        }
    }
    
    // MARK: - Properties: IBOutlets
    
    @IBOutlet weak var numberOfPlayersField: UITextField!

    @IBOutlet weak var numberOfPlayersStepper: UIStepper!
    
    // MARK: - Functions

    // MARK: - Functions: IBActions
    
    @IBAction func numberOfPlayersStepped(_ sender: UIStepper) {
        self.numberOfPlayers = Int(exactly: sender.value) ?? 0
    }
    
    // MARK: - Functions: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.decorate()
    }
}

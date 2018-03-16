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
    
    var players = [LillyPal]() {
        didSet {
            NotificationCenter.default.post(name: playerChangeNotification, object: numberOfPlayers)
            numberOfPlayersField.text = "\(numberOfPlayers)"
        }
    }
    
    var numberOfPlayers: Int { return players.count }
    
    // MARK: - Properties: IBOutlets
    
    @IBOutlet weak var numberOfPlayersField: UITextField!

    @IBOutlet weak var numberOfPlayersStepper: UIStepper!
    
    // MARK: - Functions

    // MARK: - Functions: IBActions
    
    @IBAction func numberOfPlayersStepped(_ sender: UIStepper) {
        let total = Int(exactly: sender.value) ?? 0

        let count: Int
        count = total - numberOfPlayers

        guard count != 0 else { players = []; return }
        
        if count > 0 {
            for _ in 1...count { players.append(LillyPal()) }
        } else {
            for _ in 1...abs(count) { players.removeLast() }
        }
    }
    
    // MARK: - Functions: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.decorate()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
print(" begining prep")
        if let controller = segue.destination as? CharacterSheetVC {
print(" prep is where expected")
        }
    }
}

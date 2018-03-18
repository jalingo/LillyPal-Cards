//
//  MainViewController.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/14/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, MainViewDecorator {

    // MARK: - Properties
    
    var players = [LillyPal]() {
        didSet {
            NotificationCenter.default.post(name: playerChangeNotification, object: nil)
            numberOfPlayersField.text = "\(players.count)"
            numberOfPlayersStepper.value = Double(exactly: players.count) ?? 0.0
        }
    }
    
    var selectedIndex: Int?
    
    // MARK: - Properties: IBOutlets
    
    @IBOutlet weak var numberOfPlayersField: UITextField!

    @IBOutlet weak var numberOfPlayersStepper: UIStepper!
    
    @IBOutlet weak var listOfPlayersView: UIView!
    
    // MARK: - Functions

    // MARK: - Functions: IBActions
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: playerListEditNotification, object: nil)
    }
    
    @IBAction func numberOfPlayersStepped(_ sender: UIStepper) {
        let total = Int(exactly: sender.value) ?? 0

        let count: Int
        count = total - players.count

        guard count != 0 else { players = []; return }
        
        if count > 0 {
            for _ in 1...count { players.append(LillyPal()) }
        } else {
            for _ in 1...abs(count) { players.removeLast() }
        }
    }
    
    // MARK: - Functions: UIViewController
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.decorate()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? CharacterController,
            let index = selectedIndex { controller.current = players[index] }
    }
}

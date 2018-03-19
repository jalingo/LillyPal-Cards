//
//  MainViewController.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/14/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, MainViewDecorator, MainViewUpdater, PlayerStepper {

    // MARK: - Properties
    
    var players = [LillyPal]() {
        didSet { updateViews() }
    }
    
    var selectedIndex: Int?
    
    // MARK: - Properties: IBOutlets
    
    @IBOutlet weak var numberOfPlayersField: UITextField!

    @IBOutlet weak var numberOfPlayersStepper: UIStepper!
    
    @IBOutlet weak var listOfPlayersView: UIView!
    
    // MARK: - Functions

    // MARK: - Functions: IBActions
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: playerListEditNotification, object: nil) }
    
    @IBAction func numberOfPlayersStepped(_ sender: UIStepper) { playersChanged(by: sender) }
    
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

//
//  MainViewController.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/14/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit
import MagicCloud

// MARK: Class

/// The root view controller and main view, this class contains a list of all saved characters and handles list moderation (including create new and delete functions).
class MainViewController: UIViewController, MainViewDecorator, MainViewUpdater, MainViewStepper {

    // MARK: - Properties
    
    let _players = MCMirror<LillyPal>(db: .privateDB)
    
    /// This property contains an array of the LillyPal characters being presented in `listOfPlayersView`. When set, it will update views with changes.
    var players/*: [LillyPal] { */ = [LillyPal]() {
        didSet {
//            _players.cloudRecordables = players
            updateViews()
        }
    }
    
    /// This optional property contains the index of the character selected by USER, set in `listOfPlayersView`, when not nil.
    var selectedIndex: Int?
    
    // MARK: - Properties: IBOutlets
    
    /// This IBOutlet property links to the text field displaying the number of entries in `listOfPlayersView` and should always match `players.count`.
    @IBOutlet weak var numberOfPlayersField: UITextField!

    /// This IBOutlet property links to the stepper a USER can use to adjust the number of characters in `players` and related views.
    @IBOutlet weak var numberOfPlayersStepper: UIStepper!
    
    /// This IBOutlet property links to the table view listing cells for each element in `players`.
    @IBOutlet weak var listOfPlayersView: UIView!
    
    // MARK: - Functions

    // MARK: - Functions: IBActions
    
    /// This IBAction method is triggered when USER taps the edit button and alternates the `isEditing` property of table view in `listOfPlayersView` through a notification.
    /// - Parameter sender: The UIButton that triggered IBAction call by being tapped by the USER.
    @IBAction func editButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: editButtonNotification, object: nil) }
    
    /// This IBAction method is triggered when USER interacts with `numberOfPlayersStepper` and changes the number of players in the direction USER indicated.
    /// - Parameter sender: The UIStepper that triggered IBAction call by being tapped by the USER.
    @IBAction func numberOfPlayersStepped(_ sender: UIStepper) { playersChanged(by: sender) }
    
    // MARK: - Functions: UIViewController
    
    /// When viewWillAppear is triggered in the view controller life cycle, all contained views will be decorated.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.decorate()
    }
    
    /// When a segue is being prepared, if it's destination conforms to `CharacterController` and `selectedIndex` is not nil, this method will pass the character stored in `players[selectedIndex]`.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? CharacterController,
            let index = selectedIndex { controller.current = players[index] }
        
        super.prepare(for: segue, sender: sender)
    }
}

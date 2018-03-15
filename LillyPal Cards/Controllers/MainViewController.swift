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
    
    var numberOfPlayers = 0 {
        didSet {
            guard numberOfPlayers != -1 else { numberOfPlayers = 0; return }
            guard numberOfPlayers != 13 else { numberOfPlayers = 12; return }
            numberOfPlayersField.text = "\(numberOfPlayers)"
        }
    }
    
    // MARK: - Properties: IBOutlets
    
    @IBOutlet weak var numberOfPlayersField: UITextField!

    @IBOutlet weak var numberOfPlayersStepper: UIStepper!
    
    // MARK: - Functions

    // MARK: - Functions: IBActions
    
    @IBAction func numberOfPlayersStepped(_ sender: UIStepper) {
        self.numberOfPlayers = sender.value as? Int
    }
    
    // MARK: - Functions: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.decorate()
    }
}


protocol MainViewDecorator { }

extension MainViewDecorator where Self: MainViewController {
    
    func decorate() {
        self.navigationController?.isNavigationBarHidden = true
        configureStepper()
    }
    
    fileprivate func configureStepper() {
        self.numberOfPlayersStepper.stepValue = 1.0
        self.numberOfPlayersStepper.minimumValue = 0
        self.numberOfPlayersStepper.maximumValue = 12
        
        self.numberOfPlayersStepper.value = self.numberOfPlayers
    }
}

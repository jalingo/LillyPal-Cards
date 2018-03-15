//
//  CharacterSheetVC.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/14/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

class CharacterSheetVC: UIViewController {

    // MARK: - Properties

    // MARK: - Properties: IBOutlets

    @IBOutlet weak var characterNameField: UITextField!

    @IBOutlet weak var characterHealthField: UITextField!
    
    @IBOutlet weak var characterBodyField: UITextField!
    
    @IBOutlet weak var characterMindField: UITextField!
    
    @IBOutlet weak var characterSocialField: UITextField!
    
    // MARK: - Functions
    
    // MARK: - Functions: IBActions
    
    // MARK: - Functions: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
    }
}

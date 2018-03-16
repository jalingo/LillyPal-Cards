//
//  CharacterSheetVC.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/14/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

class CharacterSheetVC: UIViewController, CharacterSheetDecorator {

    // MARK: - Properties

    var current: Character?
    
    // MARK: - Properties: IBOutlets

    @IBOutlet weak var characterNameField: UITextField!

    @IBOutlet weak var characterHealthField: UITextField!
    
    @IBOutlet weak var characterBodyField: UITextField!
    
    @IBOutlet weak var characterMindField: UITextField!
    
    @IBOutlet weak var characterSocialField: UITextField!
    
    @IBOutlet weak var characterPortrait: UIImageView!
    
    @IBOutlet weak var characterBodyStepper: UIStepper!
    
    @IBOutlet weak var characterMindStepper: UIStepper!
    
    @IBOutlet weak var characterSocialStepper: UIStepper!
    
    @IBOutlet weak var characterHealthSlider: UISlider!
    
    // MARK: - Functions
    
    // MARK: - Functions: IBActions
    
    @IBAction func previousTapped(_ sender: UIButton) { }
    
    @IBAction func nextTapped(_ sender: UIButton) { }
    
    @IBAction func nameFieldEdited(_ sender: UITextField) { }
    
    @IBAction func healthSliderAdjusted(_ sender: UISlider) { }
    
    @IBAction func bodyStepperTapped(_ sender: UIStepper) { }
    
    @IBAction func mindStepperTapped(_ sender: UIStepper) { }
    
    @IBAction func socialStepperTapped(_ sender: UIStepper) { }
    
    // MARK: - Functions: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        decorate()
    }
}

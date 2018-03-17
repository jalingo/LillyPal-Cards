//
//  CharacterSheetVC.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/14/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

class CharacterSheetVC: UIViewController, CharacterSheetDecorator, CharacterPortraitChanger, CharacterAttributeChanger, SpacesAfterDecimalCounter, FloatRounder {

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
    
    @IBAction func previousTapped(_ sender: UIButton) {
        current?.portrait = previousPortrait()
        setCurrentImage()
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        current?.portrait = nextPortrait()
        setCurrentImage()
    }
    
    @IBAction func nameFieldEdited(_ sender: UITextField) { current?.name = sender.text ?? "" }
    
    @IBAction func healthSliderAdjusted(_ sender: UISlider) {
        guard let current = current,
            let roundedValue = Int(exactly: round(off: sender.value, toPlace: 0)) else { return }
        
        characterHealthField.text = "\(roundedValue) / \(current.maxHealth)"
        self.current?.health = roundedValue
    }
    
    @IBAction func bodyStepperTapped(_ sender: UIStepper) { change(attribute: .body, to: sender.value) }
    
    @IBAction func mindStepperTapped(_ sender: UIStepper) { change(attribute: .mind, to: sender.value) }
    
    @IBAction func socialStepperTapped(_ sender: UIStepper) { change(attribute: .social, to: sender.value) }
    
    // MARK: - Functions: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        decorate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guard let pal = current as? LillyPal,
            let index = self.navigationController?.viewControllers.index(where: { $0 is MainViewController }),
            let controller = self.navigationController?.viewControllers[index] as? MainViewController,
            let selectedIndex = controller.selectedIndex else { return }
        
        controller.players[selectedIndex] = pal
    }
}

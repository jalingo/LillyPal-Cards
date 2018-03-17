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
    
    var originalState: Character?
    
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
    
    @IBAction func nameFieldEdited(_ sender: UITextField) { current?.name = sender.text ?? Defaults.characterName }
    
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
        
        originalState = current
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guard var pal = current as? LillyPal,
            let index = self.navigationController?.viewControllers.index(where: { $0 is MainViewController }),
            let controller = self.navigationController?.viewControllers[index] as? MainViewController,
            let selectedIndex = controller.selectedIndex else { return }

        // This restores health if max health changed.
        if let max = originalState?.maxHealth {
            if pal.maxHealth > max || pal.health > pal.maxHealth { pal.health = pal.maxHealth }         // <-- Resets health when max changed, and prevents health exceeding max health. !!
        }
        
        // This passes data model changes back to main view.
        controller.players[selectedIndex] = pal
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { resignCurrentResponder() }
}

// MARK: - Extensions

extension CharacterSheetVC: FirstResponderResigner {
    var responders: [UIResponder] { return [characterNameField] }
}

extension CharacterSheetVC: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

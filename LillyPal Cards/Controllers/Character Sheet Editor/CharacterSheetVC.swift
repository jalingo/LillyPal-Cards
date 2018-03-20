//
//  CharacterSheetVC.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/14/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

// MARK: Class

/// This sub-class of UIViewController is used to make changes to a specific LillyPal, and then pass those changes back to the `MainViewController` root.
class CharacterSheetVC: UIViewController, CharacterController, CharacterSheetDecorator, CharacterPortraitChanger, CharacterAttributeChanger, CharacterHealthAdjuster, CharacterReturner {

    // MARK: - Properties

    /// This optional property saves the original state of current when `viewDidLoad` is called.
    var originalState: Character?

    // MARK: - Properties: CharacterController

    /// This optional property contains the character being presented or edited, when not nil.
    var current: Character?
    
    // MARK: - Properties: IBOutlets

    /// This IBOutlet property links to the `UITextField` displaying `current?.name` string.
    @IBOutlet weak var characterNameField: UITextField!

    @IBOutlet weak var characterHealthField: UITextField!
    
    /// This IBOutlet property links to the `UITextField` displaying `current?.body` string.
    @IBOutlet weak var characterBodyField: UITextField!
    
    /// This IBOutlet property links to the `UITextField` displaying `current?.mind` string.
    @IBOutlet weak var characterMindField: UITextField!
    
    /// This IBOutlet property links to the `UITextField` displaying `current?.social` string.
    @IBOutlet weak var characterSocialField: UITextField!
    
    /// This IBOutlet property links to the `UIImageView` displaying `current?.portrait` image.
    @IBOutlet weak var characterPortrait: UIImageView!
    
    /// This IBOutlet property links to the `UIStepper` that USER interacts with to edit `current?.body` value.
    @IBOutlet weak var characterBodyStepper: UIStepper!
    
    /// This IBOutlet property links to the `UIStepper` that USER interacts with to edit `current?.mind` value.
    @IBOutlet weak var characterMindStepper: UIStepper!
    
    /// This IBOutlet property links to the `UIStepper` that USER interacts with to edit `current?.social` value.
    @IBOutlet weak var characterSocialStepper: UIStepper!
    
    /// This IBOutlet property links to the `UISlider` that USER interacts with to edit `current?.health` value.
    @IBOutlet weak var characterHealthSlider: UISlider!
    
    // MARK: - Functions
    
    // MARK: - Functions: IBActions
    
    /// This IBAction method is called when USER taps the previous image button and it changes `current?.portrait` before updating `characterPortrait` property.
    /// - Parameter sender: The UIKit object that called the IBAction.
    @IBAction func previousTapped(_ sender: UIButton) {
        current?.portrait = previousPortrait()
        setCurrentImage()
    }
    
    /// This IBAction method is called when USER taps the next image button and it changes `current?.portrait` before updating `characterPortrait` property.
    /// - Parameter sender: The UIKit object that called the IBAction.
    @IBAction func nextTapped(_ sender: UIButton) {
        current?.portrait = nextPortrait()
        setCurrentImage()
    }
    
    /// This IBAction method is called when USER makes changes to the `characterNameField` and it saves those changes to `current?.name` property.
    /// - Parameter sender: The UIKit object that called the IBAction.
    @IBAction func nameFieldEdited(_ sender: UITextField) { current?.name = sender.text ?? Defaults.characterName }

    /// This IBAction method is called when USER adjusts `characterHealthSlider` and it then calls `adjust:from` method.
    /// - Parameter sender: The UIKit object that called the IBAction.
    @IBAction func healthSliderAdjusted(_ sender: UISlider) { adjust(from: sender) }
    
    /// This IBAction method is called when USER interacts with `characterBodyStepper` and then calls `change:attribute:to` method.
    /// - Parameter sender: The UIKit object that called the IBAction.
    @IBAction func bodyStepperTapped(_ sender: UIStepper) { change(attribute: .body, to: sender.value) }
    
    /// This IBAction method is called when USER interacts with `characterMindStepper` and then calls `change:attribute:to` method.
    /// - Parameter sender: The UIKit object that called the IBAction.
    @IBAction func mindStepperTapped(_ sender: UIStepper) { change(attribute: .mind, to: sender.value) }
    
    /// This IBAction method is called when USER interacts with `characterSocialStepper` and then calls `change:attribute:to` method.
    /// - Parameter sender: The UIKit object that called the IBAction.
    @IBAction func socialStepperTapped(_ sender: UIStepper) { change(attribute: .social, to: sender.value) }
    
    // MARK: - Functions: UIViewController
    
    /// This override of `viewDidLoad` method decorates self and saves `originalState` of `current` property.
    override func viewDidLoad() {
        super.viewDidLoad()

        decorate()
        originalState = current
    }
    
    /// This override of `viewWillDisappear` method calls `returnModelToMainViewController` method.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        returnModelToMainViewController()
    }
    
    /// This override of `touchesBegan:_:with` method calls `resignCurrentResponder` method.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { resignCurrentResponder() }
}

// MARK: - Extensions

extension CharacterSheetVC: FirstResponderResigner {
    
    /// This read-only, computed property returns an array with all possible responders that can be resigned.
    var responders: [UIResponder] { return [characterNameField] }
}

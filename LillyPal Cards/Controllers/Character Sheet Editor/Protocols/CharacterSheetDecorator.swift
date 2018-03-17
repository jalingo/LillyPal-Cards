//
//  CharacterSheetDecorator.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

protocol CharacterSheetDecorator { }

extension CharacterSheetDecorator where Self: CharacterSheetVC {
    
    func decorate() {
        self.navigationController?.isNavigationBarHidden = false
        
        decorateInputFields()
        configureSlider()
        configureSteppers()
        
        setCurrentImage()
    }
    
    func decorateInputFields() {
        characterNameField.text = current?.name
        decorateAttributeFields()
        if let health = current?.health { characterHealthField.text = "\(health)" }
    }
    
    func decorateAttributeFields() {
        if let body = current?.body     { characterBodyField.text = "\(body)" }
        if let mind = current?.mind     { characterMindField.text = "\(mind)" }
        if let social = current?.social { characterSocialField.text = "\(social)" }
    }
    
    func configureSlider() {
        guard let current = current else { return }
        let maxHealth = current.mind + current.body + current.social
        
        characterHealthSlider.minimumValue = 0
        characterHealthSlider.maximumValue = Float(maxHealth)
        characterHealthSlider.setValue(Float(current.health), animated: true)
    }
    
    func configureSteppers() {
        configureStepper(characterBodyStepper, for: .body)
        configureStepper(characterMindStepper, for: .mind)
        configureStepper(characterSocialStepper, for: .social)
    }
    
    func configureStepper(_ stepper: UIStepper, for attribute: CharacterAttribute) {
        applyUniformStepperConfiguration(for: stepper)
        
        var value: Int?
        switch attribute {
        case .body:   value = current?.body
        case .mind:   value = current?.mind
        case .social: value = current?.social
        }
        
        if let value = value, let double = Double(exactly: value) { stepper.value = double }
    }
    
    func applyUniformStepperConfiguration(for stepper: UIStepper) {
        stepper.stepValue = 1.0
        stepper.minimumValue = 0
        stepper.maximumValue = 5
    }
    
    func setCurrentImage() { characterPortrait.image = current?.portrait }
}

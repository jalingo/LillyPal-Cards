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
        
        characterBodyField.text =   "\(String(describing: current?.body))"
        characterMindField.text =   "\(String(describing: current?.mind))"
        characterSocialField.text = "\(String(describing: current?.social))"
        
        characterHealthField.text = "\(String(describing: current?.health))"
    }
    
    func configureSlider() {
        guard let health = current?.health else { return }
        
        characterHealthSlider.minimumValue = 0
        characterHealthSlider.maximumValue = Float(health)
        characterHealthSlider.value = Float(health)
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

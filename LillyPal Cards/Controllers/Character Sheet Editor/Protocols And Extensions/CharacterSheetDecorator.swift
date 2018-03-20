//
//  CharacterSheetDecorator.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

// MARK: Protocol

/// Types conforming to this protocol can call several decorate and configure methods for `CharacterSheetVC` controller.
protocol CharacterSheetDecorator { }

// MARK: - Extension

extension CharacterSheetDecorator where Self: CharacterSheetVC {

    /// This void method decorates all views for `CharacterSheetVC`, matching to `current` character values, and makes navigation bar visible.
    func decorate() {
        self.navigationController?.isNavigationBarHidden = false
        
        decorateInputFields()
        configureSlider()
        configureSteppers()
        
        setCurrentImage()
    }

    /// This void method decorates `characterNameField` and `characterHealthField` properties, then calls `decorateAttributeFields` method.
    func decorateInputFields() {
        characterNameField.text = current?.name
        characterNameField.delegate = self
        
        if let health = current?.health, let max = current?.maxHealth { characterHealthField.text = "\(health) / \(max)" }

        decorateAttributeFields()
    }
    
    /// This void method decorates `characterBodyField`, `characterMindField` and `characterSocialField` properties, matching them to `current` property values.
    func decorateAttributeFields() {
        if let body = current?.body     { characterBodyField.text = "\(body)" }
        if let mind = current?.mind     { characterMindField.text = "\(mind)" }
        if let social = current?.social { characterSocialField.text = "\(social)" }
    }

    /// This void method configures `characterHealthSlider` property.
    func configureSlider() {
        guard let current = current else { return }
        let maxHealth = current.mind + current.body + current.social
        
        characterHealthSlider.minimumValue = 0
        characterHealthSlider.maximumValue = Float(maxHealth)
        characterHealthSlider.setValue(Float(current.health), animated: true)
    }
    
    /// This void method configures `characterBodyStepper`, `characterMindStepper` and `characterSocialStepper` properties.
    func configureSteppers() {
        configureStepper(characterBodyStepper, for: .body)
        configureStepper(characterMindStepper, for: .mind)
        configureStepper(characterSocialStepper, for: .social)
    }
    
    /// This fileprivate, void method configures stepper passed to it for the specified attribute.
    /// - Parameter stepper: The stepper to be configured.
    /// - Parameter attribute: The CharacterAttribute `stepper` should be configured for.
    fileprivate func configureStepper(_ stepper: UIStepper, for attribute: CharacterAttribute) {
        applyUniformStepperConfiguration(for: stepper)
        
        var value: Int?
        switch attribute {
        case .body:   value = current?.body
        case .mind:   value = current?.mind
        case .social: value = current?.social
        }
        
        if let value = value, let double = Double(exactly: value) { stepper.value = double }
    }
    
    /// This fileprivate, void method applies configurations that all steppers need, regardless of attribute.
    /// - Parameter stepper: The stepper to be configured with default step, min and max values.
    fileprivate func applyUniformStepperConfiguration(for stepper: UIStepper) {
        stepper.stepValue = 1.0
        stepper.minimumValue = 0
        stepper.maximumValue = 5
    }
    
    /// This void method sets `characterPortrait.image` property to `current?.portrait` property.
    func setCurrentImage() { characterPortrait.image = current?.portrait }
}

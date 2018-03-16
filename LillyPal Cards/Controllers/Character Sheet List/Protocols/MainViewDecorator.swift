//
//  MainViewDecorator.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

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
        
        self.numberOfPlayersStepper.value = Double(exactly: self.numberOfPlayers) ?? 0.0
    }
}

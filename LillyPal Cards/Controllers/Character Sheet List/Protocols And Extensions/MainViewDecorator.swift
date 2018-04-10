//
//  MainViewDecorator.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

/// Conforming types to this protocol can call `decorate` method when `MainViewController.viewWillAppear` is called.
protocol MainViewDecorator { }

extension MainViewDecorator where Self: MainViewController {

    /// This void method hide nav bar and configures `MainViewController.numberOfPlayersStepper`.
    func decorate() {
        self.navigationController?.navigationBar.setBackgroundImage(#imageLiteral(resourceName: "Lunch_time"), for: .default)
        self.navigationController?.isNavigationBarHidden = true
        configureStepper()
    }
    
    /// This fileprivate void method configures `MainViewController.numberOfPlayersStepper`.
    fileprivate func configureStepper() {
        self.numberOfPlayersStepper.stepValue = 1.0
        self.numberOfPlayersStepper.minimumValue = 0
        self.numberOfPlayersStepper.maximumValue = 12
        
        self.numberOfPlayersStepper.value = Double(exactly: self.players.count) ?? 0.0
    }
}

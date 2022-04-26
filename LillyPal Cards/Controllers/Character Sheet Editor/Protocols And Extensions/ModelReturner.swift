//
//  ModelReturner.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/18/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

// MARK: Protocol

/// Types conforming to this protocol can call the `returnModelToMainViewConrtroller` method and pass character model to their parent controller, when their parent is `MainViewController` with `selectedIndex` property.
protocol CharacterReturner { }

// MARK: - Extension

extension CharacterReturner where Self: CharacterSheetVC {
    
    /// This void method passes data model changes back to main view controller through navigation controller.
    func returnModelToMainViewController() {
        guard let pal = current as? LillyPal,
              let index = self.navigationController?.viewControllers.firstIndex(where: { $0 is MainViewController }),
            let controller = self.navigationController?.viewControllers[index] as? MainViewController,
            let selectedIndex = controller.selectedIndex else { return }
        
        controller.players[selectedIndex] = pal
    }
}

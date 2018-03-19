//
//  ModelReturner.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/18/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

protocol CharacterReturner { }

extension CharacterReturner where Self: CharacterSheetVC {
    
    /// This void method passes data model changes back to main view.
    func returnModelToMainViewController() {
        guard let pal = current as? LillyPal,
            let index = self.navigationController?.viewControllers.index(where: { $0 is MainViewController }),
            let controller = self.navigationController?.viewControllers[index] as? MainViewController,
            let selectedIndex = controller.selectedIndex else { return }
        
        controller.players[selectedIndex] = pal
    }
}

//
//  CharacterPortraitChanger.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

protocol CharacterPortraitChanger { }

extension CharacterPortraitChanger where Self: CharacterSheetVC {
    
    // !!
    func nextPortrait() -> UIImage {
        return UIImage()
    }
    
    // !!
    func previousPortrait() -> UIImage {
        return UIImage()
    }
}

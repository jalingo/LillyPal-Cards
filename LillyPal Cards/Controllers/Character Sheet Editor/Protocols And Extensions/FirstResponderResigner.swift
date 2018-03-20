//
//  FirstResponderResigner.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/17/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

/// Types that conform to this protocol can call the `resignCurrentResponder` method and release input keyboard.
protocol FirstResponderResigner {
    
    /// This read-only, computed property returns an array with all possible responders that can be resigned.
    var responders: [UIResponder] { get }
}

extension FirstResponderResigner {
    
    /// This void method identifies which responder in `responders` property is first responder, and then resigns.
    func resignCurrentResponder() {
        for responder in responders {
            if responder.isFirstResponder { responder.resignFirstResponder() }
        }
    }
}

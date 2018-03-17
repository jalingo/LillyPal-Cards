//
//  FirstResponderResigner.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/17/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

protocol FirstResponderResigner {
    
    // !!
    var responders: [UIResponder] { get }
}

extension FirstResponderResigner {
    
    func resignCurrentResponder() {
        for responder in responders {
            if responder.isFirstResponder { responder.resignFirstResponder() }
        }
    }
}

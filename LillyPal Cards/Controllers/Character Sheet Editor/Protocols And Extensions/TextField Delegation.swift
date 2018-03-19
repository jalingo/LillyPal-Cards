//
//  TextField Delegation.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/19/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

// MARK: Extensions

extension CharacterSheetVC: UITextFieldDelegate {
    
    /// This method disables navigation bar interaction when passed text field begins editing.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.navigationController?.navigationBar.isUserInteractionEnabled = false
    }
    
    /// This method enables navigation bar interaction when passed text field ends editing.
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.navigationController?.navigationBar.isUserInteractionEnabled = true
    }
    
    /**
        Asks the delegate if the text field should process the pressing of the return button.
   
        Calls `resignFirstResponder` on text field passed as argument.

        - Parameters textField: The text field whose return button was pressed.
        - Returns: true
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

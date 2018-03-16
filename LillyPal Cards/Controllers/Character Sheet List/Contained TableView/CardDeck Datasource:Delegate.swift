//
//  CardDeck Datasource:Delegate.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

// MARK: - Extensions

extension CardDeckTVC {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LillyPal_Cell", for: indexPath)
        
        if let cell = cell as? LillyPalCardTVC,
            let parent = parent as? MainViewController
            { cell.current = parent.players[indexPath.row] }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.parent?.performSegue(withIdentifier: "toCharacterSheet", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool { return true }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Erase") { action, path in
            if let parent = self.parent as? MainViewController { parent.players.remove(at: path.row) }
        }
        
        return [delete]
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        if let parent = self.parent as? MainViewController { parent.players.swapAt(fromIndexPath.row, to.row) }
    }
}

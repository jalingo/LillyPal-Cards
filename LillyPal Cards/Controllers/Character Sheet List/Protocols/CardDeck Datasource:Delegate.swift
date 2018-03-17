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
    
    // MARK: - TableViewDelegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryBoardIdentifier.lillyPalCell, for: indexPath)

        let index = indexPath.row
        if let cell = cell as? LillyPalCardTVC,
            let parent = parent as? MainViewController
            { cell.current = parent.players[index] }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let parent = self.parent as? MainViewController else { return }
        
        parent.selectedIndex = indexPath.row
        parent.performSegue(withIdentifier: StoryBoardIdentifier.segueToCharacterEditor, sender: self)
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
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool { return true }
    
    // MARK: - TableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let parent = self.parent as? MainViewController else { return 0 }
        return parent.players.count
    }
}

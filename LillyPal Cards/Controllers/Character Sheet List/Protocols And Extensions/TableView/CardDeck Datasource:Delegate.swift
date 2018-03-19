//
//  CardDeck Datasource:Delegate.swift
//  LillyPal Cards
//
//  Created by James Lingo on 3/16/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

// MARK: - Extensions

extension CardDeckTV {
    
    // MARK: - TableViewDelegate
    
    /// This override of table view method 'cellForRowAt' returns a cell decorated for the character matching indexPath argument.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        self.isEditing ? (cell = lillyPalCardSlim(for: indexPath)) : (cell = lillyPalCardWide(for: indexPath))
        
        let index = indexPath.row
        if let parent = parent as? MainViewController,
            let cell = cell as? CharacterController { cell.current = parent.players[index] }
        
        return cell
    }
    
    /// This override of table view method 'didSelectRowAt' sets parent's `MainViewController.selectedIndex` and calls performs segue to `CharacterSheetVC` controller.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let parent = self.parent as? MainViewController else { return }

        parent.selectedIndex = indexPath.row
        parent.performSegue(withIdentifier: StoryBoardIdentifier.segueToCharacterEditor, sender: self)
    }
    
    /// This override of table view method 'canEditRowAt' returns true.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool { return true }
    
    /// This override of table view method 'editActionsForRowAt' returns a single action that deletes the player and it's associated cell.
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Erase") { action, path in
            if let parent = self.parent as? MainViewController { parent.players.remove(at: path.row) }
        }
        
        return [delete]
    }
    
    /// This override of table view method 'moveRowAt' updates model with USER's order changes.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        if let parent = self.parent as? MainViewController { parent.players.swapAt(fromIndexPath.row, to.row) }
    }
    
    /// This override of table view method 'canMoveRowAt' returns true.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool { return true }
    
    // MARK: - TableViewDataSource

    /// This override of `numberOfSections` returns 1.
    override func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    
    /// This override of table view method 'numberOfRowsInSection' returns 'MainViewController.players.count' or 0.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let parent = self.parent as? MainViewController else { return 0 }
        return parent.players.count
    }
}

extension CardDeckTV {
    
    /// This fileprivate, void method returns a cell decorated for `tableView.isEditing` is false.
    fileprivate func lillyPalCardWide(for path: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryBoardIdentifier.lillyPalCell, for: path)
        
        let index = path.row
        if let cell = cell as? LillyPalCardTVC,
            let parent = parent as? MainViewController
        { cell.current = parent.players[index] }
        
        return cell
    }
    
    /// This fileprivate, void method returns a cell decorated for `tableView.isEditing` is true.
    fileprivate func lillyPalCardSlim(for path: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryBoardIdentifier.lillyPalSlimCell, for: path)
        return cell
    }
}

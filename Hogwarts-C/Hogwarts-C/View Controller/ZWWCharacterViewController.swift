//
//  ZWWCharacterViewController.swift
//  Hogwarts-C
//
//  Created by Zebadiah Watson on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import UIKit

class ZWWCharacterViewController: UITableViewController {
    
    var characters: [ZWWCharacter] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ZWWCharacterController.fetchCharacters { (characters) in
            self.characters = characters
            self.tableView.reloadData()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return characters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as? ZWWCharacterTableViewCell else
    { return UITableViewCell()}
        let character = characters[indexPath.row]
        
        cell.updateViews(with: character)

        // Configure the cell...

        return cell
    }
    
}// End of Class


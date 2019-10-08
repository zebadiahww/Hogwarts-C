//
//  ZWWCharacterTableViewCell.swift
//  Hogwarts-C
//
//  Created by Zebadiah Watson on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import UIKit

class ZWWCharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterRoleLabel: UILabel!
    @IBOutlet weak var houseImageView: UIImageView!
    @IBOutlet weak var bloodStatusImageView: UIImageView!
    @IBOutlet weak var deathEaterImageView: UIImageView!
    
    func updateViews(with character: ZWWCharacter) {
        
        if character.deathEater == true {
            deathEaterImageView.isHidden = false
            
        }
        
        if character.bloodStatus != "unknown" {
            bloodStatusImageView.image = UIImage.init(named: character.bloodStatus)
            bloodStatusImageView.isHidden = false
        }
        
        if let house = character.house {
            houseImageView.image = UIImage.init(named: house.lowercased())
            houseImageView.isHidden = false
        }
        
        characterNameLabel.text = character.name
        characterRoleLabel.text = character.role
        
        
    }
    

}

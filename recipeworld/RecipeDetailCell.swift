//
//  RecipeDetailCell.swift
//  recipeworld
//
//  Created by eric.tiedeken@b507.us on 4/25/17.
//  Copyright © 2017 it565purple. All rights reserved.
//

import UIKit

class RecipeDetailCell: UITableViewCell {
    
    @IBOutlet var fieldLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

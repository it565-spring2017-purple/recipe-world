//
//  RecipeCategoryCell.swift
//  recipeworld
//
//  Created by Tiedeken, Eric on 4/3/17.
//  Copyright © 2017 it565purple. All rights reserved.
//

import UIKit

class RecipeCategoryCell: UITableViewCell {
    
    @IBOutlet var categoryNameLabel: UILabel!
    @IBOutlet var categoryImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

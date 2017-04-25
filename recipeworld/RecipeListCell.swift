//
//  RecipeListCell.swift
//  test
//
//  Created by eric.tiedeken@b507.us on 4/24/17.
//  Copyright © 2017 eric.tiedeken@b507.us. All rights reserved.
//

import UIKit

class RecipeListCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    //@IBOutlet var directionsLabel: UILabel!
    //@IBOutlet var ingredientsLabel: UILabel!
    //@IBOutlet var videoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
        // Configure the view for the selected state
    }
}

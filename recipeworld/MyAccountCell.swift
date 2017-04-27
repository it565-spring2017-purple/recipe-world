//
//  MyAccountCell.swift
//  recipeworld
//
//  Created by Ravali Reddy Akkati on 4/20/17.
//  Copyright © 2017 it565purple. All rights reserved.
//

import UIKit

class profile: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

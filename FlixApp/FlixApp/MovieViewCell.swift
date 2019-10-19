//
//  MovieViewCell.swift
//  FlixApp
//
//  Created by Bryan Lopez on 10/18/19.
//  Copyright © 2019 Bryan Lopez CP. All rights reserved.
//

import UIKit

//Made a UITableCell bc we will be working on the in a cell inside the outter View Controller

class MovieViewCell: UITableViewCell {

    //Linked variables to the corresponding items for manipulation
    
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  CastCell.swift
//  Explore
//
//  Created by Christian Graver on 20/12/2018.
//  Copyright © 2018 nordgrus. All rights reserved.
//

import UIKit

class CastCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var numberOfPointsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.textColor = .white
        regionLabel.textColor = .white
        numberOfPointsLabel.textColor = .white
    }
    
    
}

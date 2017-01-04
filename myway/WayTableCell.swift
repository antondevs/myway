//
//  WayTableCell.swift
//  myway
//
//  Created by antondev on 05/01/17.
//  Copyright © 2017 engune. All rights reserved.
//

import UIKit

class WayTableCell: UITableViewCell {

    @IBOutlet weak var wayName: UILabel!
    @IBOutlet weak var wayDate: UILabel!
    @IBOutlet weak var wayImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

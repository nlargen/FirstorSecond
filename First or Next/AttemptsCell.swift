//
//  AttemptsCell.swift
//  First or Next
//
//  Created by Nicholas Largen on 12/15/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import UIKit

class AttemptsCell: UITableViewCell {

    @IBOutlet weak var AttemptsLabel: UILabel!
    @IBOutlet weak var SecondBookLabel: UILabel!
    @IBOutlet weak var FirstBookLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

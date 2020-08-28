//
//  ActionListCell.swift
//  01_Today work
//
//  Created by Song on 2020/08/05.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class ActionListCell: UITableViewCell {

    @IBOutlet weak var actionBackgroundColorView: UIView!
    @IBOutlet weak var actionTitleLabel: UILabel!
    @IBOutlet weak var doneCheckButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        actionBackgroundColorView.layer.cornerRadius = 6.0
        doneCheckButton.layer.cornerRadius = 6.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

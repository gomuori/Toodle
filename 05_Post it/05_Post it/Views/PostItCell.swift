//
//  PostItCell.swift
//  05_Post it
//
//  Created by Song on 2020/08/25.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class PostItCell: UITableViewCell {

    @IBOutlet weak var postItLabel: UILabel!
    @IBOutlet weak var dateCreated: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

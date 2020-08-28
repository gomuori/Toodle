//
//  ProjectDoneListCell.swift
//  01_Today work
//
//  Created by Song on 2020/08/03.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class ProjectDoneListCell: UITableViewCell {

    @IBOutlet weak var doneProjectView: UIView!
    @IBOutlet weak var projectTitleLabel: UILabel!
    @IBOutlet weak var numberOfTasksLabel: UILabel!
    @IBOutlet weak var completionDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        doneProjectView.layer.cornerRadius = 13.0
        doneProjectView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

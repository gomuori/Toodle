//
//  CalendarPostItCollectionViewCell.swift
//  01_Today work
//
//  Created by Song on 2020/08/04.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class CalendarPostItCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var calendarPostItLabel: UILabel!
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 12.5
    }
    
}

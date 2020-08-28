//
//  PostItCell.swift
//  01_Today work
//
//  Created by Song on 2020/07/21.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class PostItCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var postItNumImage: UIImageView!
    @IBOutlet weak var postItLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //postItNumImageBackground.layer.cornerRadius = postItNumImageBackground.frame.size.height / 3
        
        //        contentView.translatesAutoresizingMaskIntoConstraints = false
        //
        //        NSLayoutConstraint.activate([
        //            contentView.leftAnchor.constraint(equalTo: leftAnchor),
        //            contentView.rightAnchor.constraint(equalTo: rightAnchor),
        //            contentView.topAnchor.constraint(equalTo: topAnchor),
        //            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        //        ])
    }
}

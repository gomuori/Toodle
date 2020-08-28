//
//  CircleView.swift
//  01_Today work
//
//  Created by Song on 2020/07/24.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        
        UIColor(red: 0.85, green: 0.88, blue: 0.93, alpha: 1.00).set()
        
        path.fill()
    }
}

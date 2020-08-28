//
//  CalendarDefaultViewController.swift
//  01_Today work
//
//  Created by Song on 2020/07/31.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class CalendarDefaultViewController: UIViewController {
    
    @IBOutlet weak var calendarPostItCollectionView: UICollectionView!
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    var calendarPostIt: [String] = ["투들 프로젝트", "앱션", "나인트리 탈출기", "나인트리 탈출기", "투들 프로젝트", "앱션"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarPostItCollectionView.dataSource = self
        customRightBarButtonItem(title: "스케줄 추가")
        
    }
    
    func customRightBarButtonItem(title: String) {
        let rightButton = UIButton()
        //
        rightButton.setImage(UIImage(named: "ic_add_plus_12"), for: .normal)
        rightButton.imageView?.contentMode = .scaleAspectFit
        rightButton.imageEdgeInsets = UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 5)
        
        rightButton.setTitle(title, for: .normal)
        rightButton.setTitleColor(.white, for: .normal)
        //
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        rightButton.backgroundColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1.00)
        rightButton.contentEdgeInsets = UIEdgeInsets(top: 9, left: 12, bottom: 9, right: 12)
        //
        rightButton.layer.cornerRadius = 15.0
        
        navigationController?.navigationBar.addSubview(rightButton)
        rightButton.tag = 1
        rightButton.frame = CGRect(x: self.view.frame.width, y: 0, width: 120, height: 20)
        
        let targetView = self.navigationController?.navigationBar
        
        let trailingContraint = NSLayoutConstraint(item: rightButton, attribute:
            .trailingMargin, relatedBy: .equal, toItem: targetView,
                             attribute: .trailingMargin, multiplier: 1.0, constant: -16)
        let bottomConstraint = NSLayoutConstraint(item: rightButton, attribute: .bottom, relatedBy: .equal,
                                                  toItem: targetView, attribute: .bottom, multiplier: 1.0, constant: -6)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([trailingContraint, bottomConstraint])
    }
    
}

extension CalendarDefaultViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return calendarPostIt.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarPostItCollectionViewCell", for: indexPath) as! CalendarPostItCollectionViewCell
        cell.calendarPostItLabel.text = calendarPostIt[indexPath.row]
        return cell
    }
    
}

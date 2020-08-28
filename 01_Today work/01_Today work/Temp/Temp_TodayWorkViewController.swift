//
//  ViewController.swift
//  01_Today work
//
//  Created by Song on 2020/07/20.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class TodayWorkViewController: UIViewController {
    
    
    @IBOutlet weak var postItCollectionView: UICollectionView!
    @IBOutlet weak var taskCardCollectionView: UICollectionView!
    
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    @IBOutlet weak var timeUnderlineView: UIView!
    
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var workPlanSegmentedControl: UISegmentedControl!
    
    var postIt: [String] = ["휴지 사기", "물티슈 사기", "엄마한테 전화하기", "아이스크림 주문", "맥북 키보드 사기"]
    var taskCards = TaskCard.fetchTaskCards()
    let sliderLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postItCollectionView.dataSource = self
        taskCardCollectionView.dataSource = self
        
        timeUnderlineView.layer.cornerRadius = 4.0
        
        timeSlider.minimumTrackTintColor = UIColor(red: 0.36, green: 0.36, blue: 0.90, alpha: 0.07)
        timeSlider.maximumTrackTintColor = UIColor(red: 0.36, green: 0.36, blue: 0.90, alpha: 0.07)
        timeSlider.setThumbImage(progressImage(with: timeSlider.value), for: .normal)
        
        bottomSegmentedControl(segmentedControl: workPlanSegmentedControl)
        
        customRightBarButtonItem(title: "빠른 추가")
        
        addUnderlineForSelectedSegment(segmentedControl: workPlanSegmentedControl)
    }
    
    @IBAction func sliderValueChanged(_ sender: CustomSlider) {
        
        timeSlider.setThumbImage(progressImage(with: timeSlider.value), for: .normal)
        
    }
    
    func progressImage(with progress : Float) -> UIImage {
        
        let layer = CALayer()
        layer.backgroundColor = UIColor.green.cgColor
        layer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        layer.cornerRadius = 25
        
        let label = sliderLabel
        label.text = "01:00"
        layer.addSublayer(label.layer)
        label.textAlignment = .center
        label.tag = 100
        
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
        
    }
    
    func bottomSegmentedControl(segmentedControl: UISegmentedControl) {
        // Must set the background image for normal to something (even clear) else the rest won't work
        segmentedControl.setBackgroundImage(UIImage(color: .white), for: .normal, barMetrics: .default)
        segmentedControl.setBackgroundImage(UIImage(color: .clear), for: .selected, barMetrics: .default)
        segmentedControl.setDividerImage(UIImage(color: .clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.71, green: 0.73, blue: 0.78, alpha: 1.00)
            ,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1.00)
            ,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)], for: .selected)
    }
    
    func customRightBarButtonItem(title: String) {
        let rightButton = UIButton()
        rightButton.setTitle(title, for: .normal)
        rightButton.setTitleColor(.white, for: .normal)
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        rightButton.backgroundColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1.00)
        rightButton.contentEdgeInsets = UIEdgeInsets(top: 9, left: 12, bottom: 9, right: 12)
        rightButton.layer.cornerRadius = 10.0
        
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
    
    func addUnderlineForSelectedSegment(segmentedControl: UISegmentedControl) {
        //let underlineWidth: CGFloat = self.view.bounds.size.width / CGFloat(segmentedControl.numberOfSegments)
        let underlineWidth: CGFloat = self.view.bounds.size.width / CGFloat(segmentedControl.numberOfSegments) / 3
        let underlineHeight: CGFloat = 2.0
        //let underlineXPosition = CGFloat(segmentedControl.selectedSegmentIndex * Int(underlineWidth))
        let underlineXPosition = CGFloat(segmentedControl.selectedSegmentIndex * Int(underlineWidth)) + underlineWidth
        let underLineYPosition: CGFloat = 0.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1.00)
        underline.layer.cornerRadius = 1.0
        underline.tag = 1
        segmentedControl.addSubview(underline)
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        guard let underline = sender.viewWithTag(1) else {return}
        let underlineWidth: CGFloat = self.view.bounds.width / CGFloat(sender.numberOfSegments) / 3
        let segmentWidth: CGFloat = self.view.bounds.width / CGFloat(sender.numberOfSegments)
        let underlineFinalXPosition = CGFloat(sender.selectedSegmentIndex) * segmentWidth + underlineWidth
        UIView.animate(withDuration: 0.3, animations: {
            underline.frame.origin.x = underlineFinalXPosition
        })
    }
    
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension TodayWorkViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == postItCollectionView {
            return postIt.count
        } else if collectionView == taskCardCollectionView {
            return taskCards.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == postItCollectionView, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostItCollectionViewCell", for: indexPath) as? PostItCollectionViewCell {
            //cell.postItNumImage.clipsToBounds = true
            cell.postItLabel.text = postIt[indexPath.row]
            return cell
        } else if collectionView == taskCardCollectionView, let cell = taskCardCollectionView.dequeueReusableCell(withReuseIdentifier: "TaskCardCollectionViewCell", for: indexPath) as? TaskCardCollectionViewCell {
            let taskCard = taskCards[indexPath.item]
            cell.taskCard = taskCard
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
}

class CustomSlider: UISlider {
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let point = CGPoint(x: bounds.minX, y: bounds.midY)
        return CGRect(origin: point, size: CGSize(width: bounds.width, height: 14))
    }
}

public extension UIImage {
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

//extension UISegmentedControl {
//    /// Tint color doesn't have any effect on iOS 13.
//    func ensureiOS12Style() {
//        if #available(iOS 13, *) {
//            let tintColorImage = UIImage(color: tintColor)
//            // Must set the background image for normal to something (even clear) else the rest won't work
//            setBackgroundImage(UIImage(color: backgroundColor ?? .clear), for: .normal, barMetrics: .default)
//            setBackgroundImage(tintColorImage, for: .selected, barMetrics: .default)
//            setBackgroundImage(UIImage(color: tintColor.withAlphaComponent(0.2)), for: .highlighted, barMetrics: .default)
//            setBackgroundImage(tintColorImage, for: [.highlighted, .selected], barMetrics: .default)
//
//            layer.borderWidth = 1
//            layer.borderColor = tintColor.cgColor
//        }
//    }
//}

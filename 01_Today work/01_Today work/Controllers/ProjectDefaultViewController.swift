//
//  ProjectDefaultViewController.swift
//  01_Today work
//
//  Created by Song on 2020/07/29.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class ProjectDefaultViewController: UIViewController {
    
    @IBOutlet weak var doingView: UIView!
    @IBOutlet weak var doneView: UIView!
    @IBOutlet weak var doingDoneSegmentedControl: UISegmentedControl!
    
    var doneProjects = DoneProject.fetchDoneProjects()
    
    override func viewDidLoad() {
        
        bottomSegmentedControl(segmentedControl: doingDoneSegmentedControl)
        
        customRightBarButtonItem(title: "프로젝트 추가")
        
        addUnderlineForSelectedSegment(segmentedControl: doingDoneSegmentedControl)
        
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
        
        if sender.selectedSegmentIndex == 0 {
            doingView.isHidden = false
            doneView.isHidden = true
            doingDoneSegmentedControl.setTitle("doing (0)", forSegmentAt: 0)
            doingDoneSegmentedControl.setTitle("done", forSegmentAt: 1)
        } else if sender.selectedSegmentIndex == 1 {
            doingView.isHidden = true
            doneView.isHidden = false
            doingDoneSegmentedControl.setTitle("doing", forSegmentAt: 0)
            doingDoneSegmentedControl.setTitle("done (\(doneProjects.count))", forSegmentAt: 1)
            
        }
        
    }

}

//
//  TodaysProject.swift
//  01_Today work
//
//  Created by Song on 2020/07/21.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

struct TaskCard {
    
    var taskPriorityStar: UIImage
    var projectTitle = ""
    var taskTitle = ""
    var color: UIColor
    
//    init(taskPriorityStar: UIImage, projectTitle: String, taskTitle: String, color: UIColor) {
//
//        self.taskPriorityStar = taskPriorityStar
//        self.projectTitle = projectTitle
//        self.taskTitle = taskTitle
//        self.color = color
//    }
    
    static func fetchTaskCards() -> [TaskCard] {
        return [
            TaskCard(taskPriorityStar: UIImage(named: "ic_importance_high_white_16")!, projectTitle: "포트폴리오", taskTitle: "포트폴리오 웹사이트 제작", color: UIColor(red: 0.36, green: 0.36, blue: 0.90, alpha: 1.00)),
            TaskCard(taskPriorityStar: UIImage(named: "ic_importance_high_white_16")!, projectTitle: "포트폴리오", taskTitle: "포트폴리오 웹사이트 제작", color: UIColor(red: 0.26, green: 0.89, blue: 0.75, alpha: 1.00)),
            TaskCard(taskPriorityStar: UIImage(named: "ic_importance_high_white_16")!, projectTitle: "포트폴리오", taskTitle: "포트폴리오 웹사이트 제작", color: UIColor(red: 1.00, green: 0.53, blue: 0.00, alpha: 1.00))
        ]
    }
}

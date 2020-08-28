//
//  DoneProject.swift
//  01_Today work
//
//  Created by Song on 2020/08/03.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

struct DoneProject {
    
    let title: String
    let numberOfTasks: Int
    let completionDate: String
    
    static func fetchDoneProjects() -> [DoneProject] {
        return [
            DoneProject(title: "포트폴리오 완성하기", numberOfTasks: 132, completionDate: "2019.03.26"),
            DoneProject(title: "포트폴리오 완성하기", numberOfTasks: 132, completionDate: "2019.03.26"),
            DoneProject(title: "포트폴리오 완성하기", numberOfTasks: 132, completionDate: "2019.03.26"),
            DoneProject(title: "포트폴리오 완성하기", numberOfTasks: 132, completionDate: "2019.03.26"),
            DoneProject(title: "포트폴리오 완성하기", numberOfTasks: 132, completionDate: "2019.03.26"),
            DoneProject(title: "포트폴리오 완성하기", numberOfTasks: 132, completionDate: "2019.03.26"),
            DoneProject(title: "포트폴리오 완성하기", numberOfTasks: 132, completionDate: "2019.03.26"),
            DoneProject(title: "포트폴리오 완성하기", numberOfTasks: 132, completionDate: "2019.03.26")
        ]
    }
}

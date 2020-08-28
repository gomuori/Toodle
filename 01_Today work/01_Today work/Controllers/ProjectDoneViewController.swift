//
//  ProjectDoneTableViewController.swift
//  01_Today work
//
//  Created by Song on 2020/08/03.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class ProjectDoneViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var doneProjects = DoneProject.fetchDoneProjects()
    
//    var doneProjects = [
//        DoneProject(title: "포트폴리오 완성하기", numberOfTasks: 132, completionDate: "2019.03.26"),
//        DoneProject(title: "포트폴리오 완성하기", numberOfTasks: 132, completionDate: "2019.03.26"),
//        DoneProject(title: "포트폴리오 완성하기", numberOfTasks: 132, completionDate: "2019.03.26"),
//        DoneProject(title: "포트폴리오 완성하기", numberOfTasks: 132, completionDate: "2019.03.26"),
//        DoneProject(title: "포트폴리오 완성하기", numberOfTasks: 132, completionDate: "2019.03.26"),
//        DoneProject(title: "포트폴리오 완성하기", numberOfTasks: 132, completionDate: "2019.03.26"),
//        DoneProject(title: "포트폴리오 완성하기", numberOfTasks: 132, completionDate: "2019.03.26"),
//        DoneProject(title: "포트폴리오 완성하기", numberOfTasks: 132, completionDate: "2019.03.26")
//    ]
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProjectDoneListCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")

    }
}

extension ProjectDoneViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doneProjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let doneProject = doneProjects[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! ProjectDoneListCell
        cell.projectTitleLabel.text = doneProject.title
        cell.numberOfTasksLabel.text = "\(doneProject.numberOfTasks)개 태스크"
        cell.completionDateLabel.text = "\(doneProject.completionDate) 완료함"
        return cell
    }
    
    
}

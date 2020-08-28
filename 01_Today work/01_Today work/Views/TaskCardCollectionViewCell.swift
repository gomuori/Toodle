//
//  TodaysProjectCollectionViewCell.swift
//  01_Today work
//
//  Created by Song on 2020/07/21.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class TaskCardCollectionViewCell: UICollectionViewCell {
    
    let checkedImage = UIImage(named: "ic_check_black_20")
    //
    @IBOutlet weak var actionListTableView: UITableView!
    
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var taskPriorityView: UIView!
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var projectTitleLabel: UILabel!
    @IBOutlet weak var taskTitleLabel: UILabel!
    
    @IBOutlet var collectionOfActionViews: Array<UIView>!
    @IBOutlet var collectionOfStrikeThroughViews: Array<UIView>!
    
    @IBOutlet var collectionOfDoneCheckButtons: Array<UIButton>!
    
    var actions = ["로그인 버튼 시안 제작", "모바일 메인 페이지 제작", "액션을 완료한 상태입니다.", "로그인 버튼 시안 제작", "모바일 메인 페이지 제작", "액션을 완료한 상태입니다.", "로그인 버튼 시안 제작", "모바일 메인 페이지 제작", "액션을 완료한 상태입니다.", "로그인 버튼 시안 제작", "모바일 메인 페이지 제작", "액션을 완료한 상태입니다.", "로그인 버튼 시안 제작", "모바일 메인 페이지 제작", "액션을 완료한 상태입니다.", "로그인 버튼 시안 제작", "모바일 메인 페이지 제작", "액션을 완료한 상태입니다.", "로그인 버튼 시안 제작", "모바일 메인 페이지 제작", "액션을 완료한 상태입니다.", "로그인 버튼 시안 제작", "모바일 메인 페이지 제작", "액션을 완료한 상태입니다."]
    
    var taskCard: TaskCard! {
        didSet {
            self.updateUI()
        }
    }
    
    //    var isChecked: Bool = false {
    //        didSet {
    //            for collectionOfDoneCheckButton in collectionOfDoneCheckButtons {
    //                if isChecked == true {
    //                    collectionOfDoneCheckButton.setImage(checkedImage, for: UIControl.State.normal)
    //                } else {
    //                    collectionOfDoneCheckButton.setImage(nil, for: UIControl.State.normal)
    //                }
    //            }
    //        }
    //    }
    
    override func awakeFromNib() {
        actionListTableView.dataSource = self
    }
    
    func updateUI() {
        if let taskCard = taskCard {
            backgroundColorView.backgroundColor = taskCard.color.withAlphaComponent(0.07)
            taskPriorityView.backgroundColor = taskCard.color
            starImageView.image = taskCard.taskPriorityStar
            projectTitleLabel.text = taskCard.projectTitle
            projectTitleLabel.textColor = taskCard.color
            taskTitleLabel.text = taskCard.taskTitle
            
//            for collectionOfActionView in collectionOfActionViews {
//                collectionOfActionView.backgroundColor = taskCard.color.withAlphaComponent(0.07)
//                collectionOfActionView.layer.cornerRadius = 6.0
//                collectionOfActionView.layer.masksToBounds = true
//            }
//
//            for collectionOfStrikeThroughView in collectionOfStrikeThroughViews {
//                collectionOfStrikeThroughView.backgroundColor = taskCard.color
//            }
//
//            for collectionOfDoneCheckButton in collectionOfDoneCheckButtons {
//                collectionOfDoneCheckButton.backgroundColor = taskCard.color.withAlphaComponent(0.07)
//                collectionOfDoneCheckButton.layer.cornerRadius = 6.0
//                collectionOfDoneCheckButton.layer.masksToBounds = true
//                collectionOfDoneCheckButton.imageView?.contentMode = .scaleAspectFit
//            }
            
        }
        
        backgroundColorView.layer.cornerRadius = 10.0
        backgroundColorView.layer.masksToBounds = true
        taskPriorityView.layer.cornerRadius = 10.0
        taskPriorityView.layer.masksToBounds = true
        
        actionListTableView.register(UINib(nibName: "ActionListCell", bundle: nil), forCellReuseIdentifier: "ActionListCell")
    }
    
//    @IBAction func DoneCheckButtonPressed(_ sender: UIButton) {
//        
//        if sender.currentImage != nil {
//            sender.setImage(nil, for: UIControl.State.normal)
//        } else {
//            sender.setImage(checkedImage, for: UIControl.State.normal)
//        }
//
//        //isChecked = !isChecked
//    }
    
    
}

extension TaskCardCollectionViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActionListCell", for: indexPath) as! ActionListCell
        cell.actionTitleLabel.text = actions[indexPath.row]
        cell.backgroundColor = taskCard.color.withAlphaComponent(0.07)
        cell.actionBackgroundColorView.backgroundColor = taskCard.color.withAlphaComponent(0.07)
        cell.doneCheckButton.backgroundColor = taskCard.color.withAlphaComponent(0.07)
        return cell
    }
    
    
}

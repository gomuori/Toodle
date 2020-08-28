//
//  ViewController.swift
//  05_Post it
//
//  Created by Song on 2020/08/21.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var postItManager = PostItManager()
    
    var postIts = [PostItData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        postItManager.delegate = self
        
        tableView.register(UINib(nibName: "PostItCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        postItManager.performRequest()
        
    }
}

//MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(postIts.count)
        return postIts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postIt = postIts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! PostItCell
        cell.postItLabel.text = postIt.title
        return cell
    }
}

//MARK: - PostItManagerDelegate

extension ViewController: PostItManagerDelegate {
    
    func didUpdatePost(_ postItManager: PostItManager, titles: [PostItData]) {
        DispatchQueue.main.async {
            for title in titles {
                self.postIts.append(title)
            }
        self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}


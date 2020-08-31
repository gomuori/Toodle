//
//  PostItManager.swift
//  05_Post it
//
//  Created by Song on 2020/08/28.
//  Copyright © 2020 Song. All rights reserved.
//

import Foundation

protocol PostItManagerDelegate {
    func didUpdatePost(_ postItManager: PostItManager, titles: [PostItData])
    func didFailWithError(error: Error)
}

struct PostItManager {
    
    var delegate: PostItManagerDelegate?
    
    func performRequest() {
        
        //1. Create a URL
        if let url = URL(string: "https://jsonplaceholder.typicode.com/todos") {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
//                if let safeResponse = response {
//                    print("The response is \(safeResponse)")
//                }
                
                if let safeData = data {
                    //do {
                        //let json = try JSONSerialization.jsonObject(with: safeData, options: [])
                        //print("The json is \(json)")
                        
                        if let todoTitles = self.parseJSON(data: safeData) {
                            self.delegate?.didUpdatePost(self, titles: todoTitles)
                            //print(todoTitles)
                        }
                        
                    //} catch {
                    //    print(error)
                    //}
                }
            }
            //4. Start the task
            task.resume()
            
        }
    }
    
    func parseJSON(data: Data) -> [PostItData]? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([PostItData].self, from: data)
            //let todoTitles = decodedData.map { $0.title}
            //return todoTitles
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    func performPostRequest() {

        let parameters = ["username": "1@2", "tweet": "HelloWorld"]

        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
            request.httpBody = httpBody
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { (data, response, error) in
                if let safeResponse = response {
                    print("The response is \(safeResponse)")
                }
                if let safeData = data {
                    print("The data is \(safeData)")
                    do {
                        let json = try JSONSerialization.jsonObject(with: safeData, options: [])
                        print(json)
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    
}

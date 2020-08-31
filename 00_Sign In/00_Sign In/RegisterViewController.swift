//
//  RegisterViewController.swift
//  00_Sign In
//
//  Created by Song on 2020/08/31.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        print(UIDevice.current)
        if let email = emailTextField.text, let password = passwordTextField.text, let passswordConfirm = passwordConfirmTextField.text {
            performRequest(mail: email, pw: password, pw_re: passswordConfirm, push_token: "12345abcde")
        }
    }
    
    func performRequest(mail: String, pw: String, pw_re: String, push_token: String) {

        let baseURL = "http://toodletoodle.cafe24.com/_api"
        let script = "user.php"
        let mode = "join_mail"

        let parameters = [
            "mail": mail,
            "pw": pw,
            "pw_re": pw_re,
            "push_token": push_token
        ]

        let urlString = "\(baseURL)/\(script)?mode=\(mode)"
        print(urlString)

        if let url = URL(string: urlString) {
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

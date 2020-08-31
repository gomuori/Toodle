//
//  ViewController.swift
//  00_Sign In
//
//  Created by Song on 2020/08/31.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInDelegate {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        // Perform any operations on signed in user here.
        //let userId = user.userID                  // For client-side use only!
        //let idToken = user.authentication.idToken // Safe to send to the server
        
        if let userId = user.userID, let idToken = user.authentication.idToken {
            performRequest(googleID: userId, pushToken: idToken)
            print("The user who is logged in is \(userId)")
            print("The user's id token is \(idToken)")
        }
        //let idToken = user.authentication.idToken,
        
        if let currentUser = GIDSignIn.sharedInstance()?.currentUser {
            print(currentUser.profile.email!)
        }
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
    }
    
    
    func performRequest(googleID: String, pushToken: String) {
        
        let baseURL = "http://toodletoodle.cafe24.com/_api"
        let script = "user.php"
        let mode = "join_google"
        
        let parameters = ["google_id": googleID, "push_token": pushToken]
        print("Google ID is \(googleID)")
        print("Push Token is \(pushToken)")
        
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
    
    @IBAction func didTapSignOut(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.signOut()
        print("Logged Out Successfully")
    }
    
}


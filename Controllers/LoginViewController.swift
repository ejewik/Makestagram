//
//  LoginViewController.swift
//  Makestagram
//
//  Created by Emily Jewik on 7/9/18.
//  Copyright © 2018 Emily Jewik. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    

    
    
    //Mark: Properties
    @IBOutlet weak var loginButton: UIButton!
    
    //Mark: - VC Lifestyle
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("testing")
        
    }
    
    //Mark: - IBActions
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        authUI.delegate = self
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        
        // 1
        guard let user = user
            else { return }
        
        // 2
        let userRef = Database.database().reference().child("users").child(user.uid)
        
       
      // UserService.show(forUID: user.uid) { (user) in
            
        userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in // left this as userRef - does it matter?
            if let user = User(snapshot: snapshot) {
                User.setCurrent(user, writeToUserDefaults: true)
                
                    let initialViewController = UIStoryboard.initialViewController(for: .main)
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                
            } else {
                // 1
                self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
            }
        })
}
}


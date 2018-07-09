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

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    

    
    
    //Mark: Properties
    @IBOutlet weak var loginButton: UIButton!
    
    //Mark: - VC Lifestyle
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
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
        print("handle user signup / login")
    }
}

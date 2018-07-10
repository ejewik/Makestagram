//
//  UserService.swift
//  Makestagram
//
//  Created by Emily Jewik on 7/9/18.
//  Copyright © 2018 Emily Jewik. All rights reserved.
//
/*
import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase


struct UserService {
    static func create(_ firUser: FIRUser, username: String, completion: @escaping (User?) -> Void) {
        let userAttrs = ["username": username]

        let ref = Database.database().reference().child("users").child(firUser.uid)
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
        }
        //supposed to be userRef?
            
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                if let user = User(snapshot: snapshot) {
                    print("Welcome back, \(user.username).")
                } else {
                    print("New user!")
                }
            })
           }
}


*/

//
//  PostService.swift
//  Makestagram
//
//  Created by Emily Jewik on 7/11/18.
//  Copyright © 2018 Emily Jewik. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseDatabase

struct PostService {
    static func create(for image: UIImage) {
        let imageRef = Storage.storage().reference().child("test_image.jpg")
        StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
            guard let downloadURL = downloadURL else {
                return
            }
            let urlString = downloadURL.absoluteString
            print("image url: \(urlString)")
        }
    }
    
    private static func create(forURLString urlString: String, aspectHeight: CGFloat ) {
        let currentUser = User.current
    }
    
    let post = Post(imageURL: urlString, imageHeight: aspectHeight)
    
    let dict = post.dictValue
    
    let postRef = Database.database().reference().child("posts").child(currentUser.uid).childByAutoId()
    
    postRef.updateChildValues(dict)
}

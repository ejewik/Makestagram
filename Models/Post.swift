//
//  Post.swift
//  Makestagram
//
//  Created by Emily Jewik on 7/11/18.
//  Copyright © 2018 Emily Jewik. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase.FIRDataSnapshot

class Post {
    var key: String?
    let imageURL: String
    let imageHeight: CGFloat
    let creationDate: Date
    
    var dictValue: [String : Any] {
        let createdAgo = creationDate.timeIntervalSince1970
        
        return ["image_url" : imageURL,
                "image_height" : imageHeight,
                "created_at" : createdAgo]
    }
    
    init(imageURL: String, imageHeight: CGFloat) {
        self.imageURL = imageURL
        self.imageHeight = imageHeight
        self.creationDate = Date()
    }
    
}

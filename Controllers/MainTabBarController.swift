//
//  MainTabBarController.swift
//  Makestagram
//
//  Created by Emily Jewik on 7/11/18.
//  Copyright © 2018 Emily Jewik. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    //Mark: Properties
    
    let photoHelper = MGPhotoHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoHelper.completionHandler = { image in
            PostService.create(for: image)
        }
        
        // 1
        delegate = self
        // 2
        tabBar.unselectedItemTintColor = .black
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool{
        if viewController.tabBarItem.tag == 1 {
            photoHelper.presentActionSheet(from: self)
        
        return false
    }
        return true
    }
}


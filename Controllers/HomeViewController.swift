//
//  HomeViewController.swift
//  Makestagram
//
//  Created by Emily Jewik on 7/10/18.
//  Copyright © 2018 Emily Jewik. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    //properties
    
    var posts = [Post]()
    
    
    
    //subviews
    
    @IBOutlet weak var tableView: UITableView!
    
    //VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserService.posts(for: User.current) { (posts) in
            self.posts = posts
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostImageCell", for: indexPath)
        cell.backgroundColor = .red
        
        return cell
    }
}

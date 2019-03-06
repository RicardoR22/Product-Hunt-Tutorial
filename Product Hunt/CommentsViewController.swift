//
//  CommentsViewController.swift
//  Product Hunt
//
//  Created by Ricardo Rodriguez on 3/5/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    
    @IBOutlet weak var commentsTableView: UITableView!
    
    var comments: [String]! {
        didSet{
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
    }
    

}

// MARK: UITableViewDatasource
extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
        
        let comment = comments[indexPath.row]
        cell.commentTextView.text = comment
        return cell
    }
}

// MARK: UITableViewDelegate
extension CommentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}

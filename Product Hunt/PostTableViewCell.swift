//
//  PostTableViewCell.swift
//  Product Hunt
//
//  Created by Ricardo Rodriguez on 3/4/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var votesCountLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    
    var post: Post? {
        didSet {
            guard let post = post else { return }
            nameLabel.text = post.name
            taglineLabel.text = post.tagline
            commentsCountLabel.text = "Comments: \(post.commentsCount)"
            votesCountLabel.text = "Votes: \(post.votesCount)"
            updatePreviewImage()
        }
    }
    
    func updatePreviewImage() {
        guard let post = post else { return }
        let url = post.previewImageURL
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil {
                let loadedImage = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.previewImageView.image = loadedImage
                }
            }
        }
        task.resume()
        
    }
    
}

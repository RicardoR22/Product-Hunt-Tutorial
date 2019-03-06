//
//  Comment.swift
//  Product Hunt
//
//  Created by Ricardo Rodriguez on 3/5/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import Foundation

struct Comment: Decodable {
    let id: Int
    let body: String
}

struct CommentApiResponse: Decodable {
    let comments: [Comment]
}

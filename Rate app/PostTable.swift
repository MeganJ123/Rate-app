//
//  PostTable.swift
//  Rate app
//
//  Created by Megan Jinks on 24/01/2019.
//  Copyright © 2019 Megan Jinks. All rights reserved.
//
class Post {
    
    var PostID: Int
    var RateID: Int
    var UserID: Int
    var ProductID: Int
    var CommentID: Int
    
    init(PostID: Int, RateID: Int, UserID: Int, ProductID: Int, CommentID: Int) {
        
        self.PostID = PostID
        self.RateID = RateID
        self.UserID = UserID
        self.ProductID = ProductID
        self.CommentID = CommentID
    }
    
}

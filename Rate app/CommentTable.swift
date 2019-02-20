//
//  CommentTable.swift
//  Rate app
//
//  Created by Megan Jinks on 24/01/2019.
//  Copyright © 2019 Megan Jinks. All rights reserved.
//
class Comment {
    
    var CommentID: Int
    var PostID: Int
    var comment: String?
    var orderCom: Int
    var UserID: Int
    
    init(CommentID: Int, PostID: Int, comment: String?, orderCom: Int, UserID: Int){
        
        self.CommentID = CommentID
        self.PostID = PostID
        self.comment = comment
        self.orderCom = orderCom
        self.UserID = UserID
        
    }
    
}

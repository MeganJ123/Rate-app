//
//  RateTable.swift
//  Rate app
//
//  Created by Megan Jinks on 24/01/2019.
//  Copyright © 2019 Megan Jinks. All rights reserved.
//
class Rate {
    
    var RateID: Int
    var ProductID: Int
    var PostID: Int
    var rating: Int
    var UserID: Int
    
    init(RateID: Int, ProductID: Int, PostID: Int, rating: Int, UserID: Int) {
        self.RateID = RateID
        self.ProductID = ProductID
        self.PostID = PostID
        self.rating = rating
        self.UserID = UserID
        
    }
    
    
}

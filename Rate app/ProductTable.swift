//
//  ProductTable.swift
//  Rate app
//
//  Created by Megan Jinks on 23/01/2019.
//  Copyright © 2019 Megan Jinks. All rights reserved.
class Product {
    
    var ProductID: Int
    var product: String?
    var PostID: Int
    var price: Int
    var brand: String?
    var UserID: Int
    
    init(ProductID: Int, product: String?, PostID: Int, price: Int, brand: String?, UserID: Int) {
        self.ProductID = ProductID
        self.product = product
        self.PostID = PostID
        self.price = price
        self.brand = brand
        self.UserID = UserID
        
    }
}

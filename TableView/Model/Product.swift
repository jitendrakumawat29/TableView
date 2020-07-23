//
//  Product.swift
//  TableViewDemo
//  Created by Jitendra Kumar on 21/07/20.
//  Copyright © 2020 Jitendra Kumar. All rights reserved.


import UIKit

// product list model
struct Product: Decodable {
    // MARK: struct properties
    var title : String?
    var imageURL : String?
    var description : String?
    // set CodingKeys if your properties name differ from api response key name
    enum CodingKeys: String, CodingKey {
       case title
       case imageURL = "imageHref"
       case description
    }
    
}

// Main API result model
struct ProductResult: Decodable {
    // MARK: struct properties
    let title: String?
    let products: [Product]?
        // set CodingKeys if your properties name differ from api response key name
        enum CodingKeys: String, CodingKey {
           case title
           case products = "rows"
        }
}


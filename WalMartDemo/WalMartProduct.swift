//
//  WalMartProduct.swift
//  WalMartDemo
//
//  Created by Evan Davis on 4/10/17.
//  Copyright © 2017 Evan Davis. All rights reserved.
//

import UIKit

struct WalMartProduct {
    
    let productId:String
    let productName:String
    let shortDescription:String
    let longDescription:String
    let price:String
    let productImageURL:String
    let reviewRating:Double
    let reviewCount:Int
    let inStock:Bool
    
    init(withDictionary dictionary:[String : AnyObject]) {
        productId = dictionary["productId"] as? String ?? ""
        productName = dictionary["productName"] as? String ?? ""
        shortDescription = dictionary["shortDescription"] as? String ?? ""
        longDescription = dictionary["longDescription"] as? String ?? ""
        price = dictionary["price"] as? String ?? ""
        productImageURL = dictionary["productImageURL"] as? String ?? ""
        reviewRating = dictionary["reviewRating"] as? Double ?? 0.0
        reviewCount = dictionary["reviewCount"] as? Int ?? 0
        inStock = dictionary["inStock"] as? Bool ?? false
    }
}

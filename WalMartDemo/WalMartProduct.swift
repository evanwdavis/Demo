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
        productName = WalMartProduct.stripHTML(from: dictionary["productName"] as? String ?? "")
        shortDescription = WalMartProduct.stripHTML(from: dictionary["shortDescription"] as? String ?? "")
        longDescription = WalMartProduct.stripHTML(from: dictionary["longDescription"] as? String ?? "")
        price = dictionary["price"] as? String ?? ""
        productImageURL = dictionary["productImageURL"] as? String ?? ""
        reviewRating = dictionary["reviewRating"] as? Double ?? 0.0
        reviewCount = dictionary["reviewCount"] as? Int ?? 0
        inStock = dictionary["inStock"] as? Bool ?? false
    }
    
    static func stripHTML(from string:String) -> String {
        let htmlStringData = string.data(using: String.Encoding.utf8)!
        let options: [String: AnyObject] = [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType as AnyObject, NSCharacterEncodingDocumentAttribute: NSNumber(value:String.Encoding.utf8.rawValue)]
        let attributedHTMLString = try! NSAttributedString(data: htmlStringData, options: options, documentAttributes: nil)
        return attributedHTMLString.string
    }
}

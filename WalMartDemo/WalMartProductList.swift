//
//  WalMartProductList.swift
//  WalMartDemo
//
//  Created by Evan Davis on 4/10/17.
//  Copyright © 2017 Evan Davis. All rights reserved.
//

import UIKit

class WalMartProductList {
    let products:[WalMartProduct]
    let totalProducts:Int
    let pageNumber:Int
    let pageSize:Int
    
    init(withDictionary dictionary:[String : AnyObject]) {
        products = dictionary["products"] as? [WalMartProduct] ?? []
        totalProducts = dictionary["totalProducts"] as? Int ?? 0
        pageNumber = dictionary["pageNumber"] as? Int ?? 0
        pageSize = dictionary["pageSize"] as? Int ?? 0
    }
}

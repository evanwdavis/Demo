//
//  WalMartProductManager.swift
//  WalMartDemo
//
//  Created by Evan Davis on 4/10/17.
//  Copyright © 2017 Evan Davis. All rights reserved.
//

import UIKit

enum WalMartProductFetchStatus {
    case success, failure, maxProducts, currentlyFetching
}

class WalMartProductManager {
    
    typealias ProductFetchCompletion = (WalMartProductFetchStatus) -> ()

    var allProducts: [WalMartProduct] = []
    
    private var totalProducts: Int = 0
    private var currentPage: Int = 0
    private var isFetchingNewPage: Bool = false
    private var productPages: [WalMartProductList] = []
    
    
    func fetchNextPage(withCompletion completion:@escaping ProductFetchCompletion) {
        if isFetchingNewPage {
            completion(.currentlyFetching)
        } else {//if currentPage == 0 || allProducts.count < totalProducts {
            isFetchingNewPage = true
            APIClient.sharedClient.getProducts(onPage: currentPage + 1, with: { [weak self] (success, productList) in
                if let productPage = productList, success {
                    self?.addNew(productPage: productPage)
                    self?.currentPage += 1
                    completion(.success)
                    print("\(self?.totalProducts) \(self?.allProducts.count)")
                } else {
                    completion(.failure)
                }
                self?.isFetchingNewPage = false
            })
        }
//        else {
//            completion(.maxProducts)
//        }
    }
    
    func addNew(productPage:WalMartProductList) {
        totalProducts = productPage.totalProducts
        productPages.append(productPage)
        allProducts.append(contentsOf: productPage.products)
    }
    
}

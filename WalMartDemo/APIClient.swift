//
//  APIClient.swift
//  WalMartDemo
//
//  Created by Evan Davis on 4/8/17.
//  Copyright © 2017 Evan Davis. All rights reserved.
//

import UIKit

class APIClient {
    
    typealias ClientCompletion = (_ success: Bool, _ resultObject: AnyObject?) -> ()
    
    static let apiKey = "70c9a3bd-0460-4fd8-be66-56a65b927804"
    static let sharedClient = APIClient()

    private func dataTask(request: NSMutableURLRequest, method: String, completion:@escaping ClientCompletion) {
        request.httpMethod = method
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                    completion(true, json as AnyObject)
                } else {
                    completion(false, json as AnyObject)
                }
            }
            }.resume()
    }
    
    fileprivate func get(request: NSMutableURLRequest, completion:@escaping ClientCompletion) {
        dataTask(request: request, method: "GET", completion: completion)
    }
    
    fileprivate func clientURLRequest(path: String, params: String) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(url: URL(string: "https://walmartlabs-test.appspot.com/_ah/api/walmart/v1/" + path + "/" + APIClient.apiKey + "/" + params)! as URL)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        return request
    }
}

//MARK: Product API Calls

extension APIClient {
    
    typealias ProductCompletion = (_ success: Bool, _ productList: WalMartProductList?) -> ()
    
    static let pageSize = 15
    static let productPath = "walmartproducts"
    
    func getProducts(onPage page:Int, with completion: @escaping ProductCompletion) {
        let request = self.clientURLRequest(path: APIClient.productPath, params: "\(page)/\(APIClient.pageSize)")
        self.get(request: request) { (success, resultObject) in
            if let resultDictionary = resultObject as? [String: AnyObject], success{
                var productListDictionary = resultDictionary
                var products: [WalMartProduct] = []
                let rawProducts = resultObject?["products"] as? [[String : AnyObject]] ?? []
                for productDict in rawProducts {
                    products.append(WalMartProduct(withDictionary:productDict))
                }
                productListDictionary["products"] = products as AnyObject
                let productListObject = WalMartProductList(withDictionary:productListDictionary)
                completion(true, productListObject)
            } else {
                completion(false, nil)
            }
        }
    }
    
}

///walmartproducts/70c9a3bd-0460-4fd8-be66-56a65b927804/1/50

//
//  Extensions.swift
//  WalMartDemo
//
//  Created by Evan Davis on 4/11/17.
//  Copyright © 2017 Evan Davis. All rights reserved.
//

import UIKit


extension String {
    func stringByRemovingHTML() -> String {
        let htmlStringData = self.data(using: String.Encoding.utf8)!
        let options: [String: AnyObject] = [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType as AnyObject, NSCharacterEncodingDocumentAttribute: NSNumber(value:String.Encoding.utf8.rawValue)]
        let attributedHTMLString = try! NSAttributedString(data: htmlStringData, options: options, documentAttributes: nil)
        return attributedHTMLString.string
    }
}

//
//  ProductInfoTableViewCell.swift
//  WalMartDemo
//
//  Created by Evan Davis on 4/11/17.
//  Copyright © 2017 Evan Davis. All rights reserved.
//

import UIKit

let ProductInfoCellIdentifier = "ProductInfoTableViewCell"

class ProductInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var priceLabel:UILabel!
    @IBOutlet weak var ratingLabel:UILabel!
    @IBOutlet weak var reviewCountLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    
    func setInfo(with product:WalMartProduct) {
        priceLabel.text = product.price
        ratingLabel.text = String(format: "%.1f", product.reviewRating)
        reviewCountLabel.text = "\(product.reviewCount)"
        descriptionLabel.text = product.longDescription
    }

}

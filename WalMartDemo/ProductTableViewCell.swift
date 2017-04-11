//
//  ProductTableViewCell.swift
//  WalMartDemo
//
//  Created by Evan Davis on 4/10/17.
//  Copyright © 2017 Evan Davis. All rights reserved.
//

import UIKit

let ProductCellIdentifier = "ProductTableViewCell" 

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var priceLabel:UILabel!
    @IBOutlet weak var shortDescriptionLabel:UILabel!
}

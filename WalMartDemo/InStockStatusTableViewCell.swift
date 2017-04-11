//
//  InStockStatusTableViewCell.swift
//  WalMartDemo
//
//  Created by Evan Davis on 4/11/17.
//  Copyright © 2017 Evan Davis. All rights reserved.
//

import UIKit

enum StockStatus {
    case inStock, outOfStock
}

let InStockStatusCellIdentifier = "InStockStatusTableViewCell"

class InStockStatusTableViewCell: UITableViewCell {

    @IBOutlet weak var stockLabel:UILabel!
    
    func setStockStatus(with status:StockStatus) {
        switch status {
        case .inStock:
            self.contentView.backgroundColor = .green
            self.stockLabel.text = "In Stock"
            break
        case .outOfStock:
            self.contentView.backgroundColor = .red
            self.stockLabel.text = "Out of Stock"
            break
        }
    }

}

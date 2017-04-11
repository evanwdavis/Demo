//
//  DetailViewController.swift
//  WalMartDemo
//
//  Created by Evan Davis on 3/21/17.
//  Copyright © 2017 Evan Davis. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var product:WalMartProduct?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        tableView.reloadData()
//    }
    
    //MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product != nil ? 3 : 0
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let product = product {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: InStockStatusCellIdentifier) as! InStockStatusTableViewCell
                cell.setStockStatus(with: product.inStock ? .inStock : .outOfStock)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: ProductNameCellIdentifier) as! ProductNameTableViewCell
                cell.nameLabel.text = product.productName
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: ProductInfoCellIdentifier) as! ProductInfoTableViewCell
                cell.setInfo(with: product)
                return cell
            default:
                break
            }
        }
        return UITableViewCell()
    }


}


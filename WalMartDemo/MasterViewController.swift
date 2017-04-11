//
//  MasterViewController.swift
//  WalMartDemo
//
//  Created by Evan Davis on 3/21/17.
//  Copyright © 2017 Evan Davis. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    let productManager = WalMartProductManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        productManager.fetchNextPage(withCompletion: { [weak self] (fetchStatus) in
            DispatchQueue.main.async {
                    self?.tableView.reloadData()
            }
        })
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = productManager.allProducts[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.product = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productManager.allProducts.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < productManager.allProducts.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductCellIdentifier, for: indexPath) as! ProductTableViewCell
            
            let object = productManager.allProducts[indexPath.row]
            cell.titleLabel.text = object.productName
            cell.priceLabel.text = object.price
            cell.shortDescriptionLabel.text = object.shortDescription
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: LoadMoreCellIdentifier, for: indexPath) as! LoadMoreTableViewCell
            if productManager.isFetchingNewPage {
                cell.setCellState(with: .loading)
            } else if productManager.canLoadMoreProducts() {
                cell.setCellState(with: .loadMore)
            } else {
                cell.setCellState(with: .showingAll)
            }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return productManager.canLoadMoreProducts()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == productManager.allProducts.count {
            tableView.deselectRow(at: indexPath, animated: false)
            productManager.fetchNextPage(withCompletion: { [weak self] (fetchStatus) in
                DispatchQueue.main.async {
                    if fetchStatus == .success {
                        self?.tableView.reloadData()
                    }
                }
            })
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }

}


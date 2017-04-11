//
//  LoadMoreTableViewCell.swift
//  WalMartDemo
//
//  Created by Evan Davis on 4/11/17.
//  Copyright © 2017 Evan Davis. All rights reserved.
//

import UIKit

enum LoadCellState {
    case loadMore, showingAll, loading
}

let LoadMoreCellIdentifier = "LoadMoreTableViewCell"

class LoadMoreTableViewCell: UITableViewCell {

    @IBOutlet weak var statusLabel:UILabel!
    @IBOutlet weak var activityIndicator:UIActivityIndicatorView!
    
    func setCellState(with state:LoadCellState) {
        switch state {
        case .loadMore:
            self.activityIndicator.stopAnimating()
            self.statusLabel.text = "Show More"
            self.statusLabel.textColor = .blue
            self.statusLabel.isHidden = false
            break
        case .showingAll:
            self.activityIndicator.stopAnimating()
            self.statusLabel.text = "All Products Shown"
            self.statusLabel.textColor = .gray
            self.statusLabel.isHidden = false
            break
        case .loading:
            self.activityIndicator.startAnimating()
            self.statusLabel.isHidden = true
            break
        }
    }

}

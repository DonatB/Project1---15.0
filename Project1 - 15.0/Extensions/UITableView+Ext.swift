//
//  UITableView+Ext.swift
//  Project1 - 15.0
//
//  Created by Donat Bajrami on 30.9.21.
//

import UIKit

extension UITableView {
        
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}

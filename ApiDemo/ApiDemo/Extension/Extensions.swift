//
//  Extensions.swift
//  ApiDemo
//
//  Created by Jinali Chavda on 4/30/24.
//

import Foundation
import UIKit

extension UITableView {
    
    
    func showBottomLoader() {
        self.contentOffset.y = self.contentOffset.y + 150
        let view = CustomLoader(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 50))
        self.tableFooterView = view
    }
    
    func removeBottomLoader() {
        self.contentOffset.y = self.contentOffset.y - 50
        self.tableFooterView = nil
    }
}

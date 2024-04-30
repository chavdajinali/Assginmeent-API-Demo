//
//  CustomLoader.swift
//  ApiDemo
//
//  Created by Jinali Chavda on 4/30/24.
//

import Foundation
import UIKit

class CustomLoader: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var activity: UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("CustomLoader", owner: self)
        self.addSubview(contentView)
        contentView.frame = self.frame
        
        activity.startAnimating()
    }
}

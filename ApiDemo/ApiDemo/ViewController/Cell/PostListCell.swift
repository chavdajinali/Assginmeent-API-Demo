//
//  ListCell.swift
//  ApiDemo
//
//  Created by Jinali Chavda on 4/30/24.
//

import Foundation
import UIKit

class PostListCell: UITableViewCell {
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    func configureCell(_ postModel: PostModel) {
        lblId.text = "\(postModel.id ?? 0)"
        lblTitle.text = postModel.title
    }
}

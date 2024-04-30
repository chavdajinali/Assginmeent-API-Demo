//
//  DetailViewController.swift
//  ApiDemo
//
//  Created by Jinali Chavda on 4/30/24.
//

import Foundation
import UIKit

class PostDetailViewController: UIViewController, Storyboardable {
    
    static let storyboardName: storyboardName = .Main
    var viewModel: DetailViewModel!
    
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        lblId.text = "\(viewModel.post?.id ?? 0)"
        lblTitle.text = viewModel.post?.title
        lblBody.text = viewModel.post?.body
    }
}

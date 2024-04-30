//
//  ViewController.swift
//  ApiDemo
//
//  Created by Jinali Chavda on 4/30/24.
//

import UIKit

class PostListViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var viewModel: PostListViewModel!
    var startDate = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        configreUI()
    }
    
    func configreUI() {
        viewModel = PostListViewModel(listProtocol: PostListRepository())
        
        tblView.register(UINib(nibName: String(describing: PostListCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PostListCell.self))
        
        viewModel.posts.bind { [weak self] posts in
            DispatchQueue.main.async {
                self?.tblView.removeBottomLoader()
                self?.tblView.reloadData()
            }
            let executionTime = Date().timeIntervalSince(self?.startDate ?? Date())
            print("Execution Time: \(executionTime) seconds")
        }
        
        viewModel.updateError = { [weak self] error in
            print(error)
            let executionTime = Date().timeIntervalSince(self?.startDate ?? Date())
            print("Execution Time: \(executionTime) seconds")
        }
        
        loadMorehData()
    }
    
    func moveToDetail(_ post: PostModel) {
        let vc = PostDetailViewController.storyboardViewController()
            vc.viewModel = DetailViewModel(post: post)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func loadMorehData() {
        startDate = Date()
        tblView.showBottomLoader()
        viewModel.getPostByPage()
    }

}

extension PostListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostListCell.self), for: indexPath) as! PostListCell
            cell.configureCell(viewModel.posts.value![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let count = viewModel.posts.value?.count, count - 1 == indexPath.row, viewModel.hasValue  {
            viewModel.page = viewModel.page  + viewModel.limit + ((viewModel.page == 0) ?  1 : 0)
            loadMorehData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveToDetail(viewModel.posts.value![indexPath.row])
    }
}

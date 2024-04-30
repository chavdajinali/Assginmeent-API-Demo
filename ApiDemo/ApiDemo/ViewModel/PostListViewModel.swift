//
//  ListViewModel.swift
//  ApiDemo
//
//  Created by Jinali Chavda on 4/30/24.
//

import Foundation


class PostListViewModel {
    var posts = Bindable<[PostModel]>()
    
    var listProtocol: PostListViewProtocol?
    var updateError: ((_ error: String) -> Void)?
    var page = 0
    var limit = 20
    var hasValue = true
    
    init(listProtocol: PostListViewProtocol) {
        self.listProtocol = listProtocol
    }
    
    func getPostByPage() {
        print("Page: \(page)")
        
        self.listProtocol?.getListOfPosts(self.page, success: { [weak self] data in
            self?.addPosta(data)

            if data.count == 0  {
                self?.hasValue = false
            }

        }, fail: { [weak self] error in
            if let errorUpdate = self?.updateError {
                errorUpdate(error?.localizedDescription ?? "")
            }
        })
    }
    
    func addPosta(_ data: [PostModel]) {
        if let value = self.posts.value {
            var dataValue = value
                dataValue.append(contentsOf: data)
            self.posts.value = dataValue
            
        } else {
            self.posts.value = data
        }
    }
}

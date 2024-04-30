//
//  ListRepository.swift
//  ApiDemo
//
//  Created by Jinali Chavda on 4/30/24.
//

import Foundation


class PostListRepository: PostListViewProtocol {
    
    func getListOfPosts(_ page: Int, success: @escaping (([PostModel]) -> Void), fail: @escaping ((_ error: NSError?) -> Void)) {
        let task = URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/posts?_start=\(page)&_limit=20")!)) { data, response, error in
            
            if error == nil {
                do {
                    let data = try JSONDecoder().decode([PostModel].self, from: data!)
                    success(data)
                    
                } catch {
                    fail(NSError(domain: "Error in decoding data", code: 501))
                }
                
            } else {
                fail(error as? NSError)
            }
        }
        task.resume()
    }
}

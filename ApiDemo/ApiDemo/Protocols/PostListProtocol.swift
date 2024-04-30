//
//  ListProtocol.swift
//  ApiDemo
//
//  Created by Jinali Chavda on 4/30/24.
//

import Foundation

protocol PostListViewProtocol {
    
    func getListOfPosts(_ page: Int , success: @escaping(([PostModel]) -> Void), fail: @escaping((_ error: NSError?) -> Void))
}

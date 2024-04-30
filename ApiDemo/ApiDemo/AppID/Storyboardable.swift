//
//  Storyboardable.swift
//  ApiDemo
//
//  Created by Jinali Chavda on 4/30/24.
//

import Foundation
import UIKit

protocol Storyboardable {
    static var storyboardName: storyboardName { get }
}

extension Storyboardable where Self: UIViewController {
    static var storyBoardName: String {
        return storyboardName.rawValue
    }
    
    static func storyboardViewController() -> Self {
        let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)
        let name = String(describing: self)
        guard let vc = storyboard.instantiateViewController(withIdentifier: name) as? Self else {
            fatalError("Could not instantiate initial storyboard with name: \(storyboardName)")
        }
        return vc
    }
}

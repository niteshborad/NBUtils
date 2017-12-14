//
//  UIViewController+Storyboard.swift
//
//  Created by Nitesh Borad on 11/12/17.
//  Copyright © 2017 Nitesh Borad. All rights reserved.
//

import UIKit

// If there are multiple storyboards in the project, each one must be named here:
enum Storyboard: String {
    case main = "Main"
    case launchScreen = "LaunchScreen"
}

protocol StoryboardInstantiable {
    static var storyboardIdentifier: String { get }
    static func instantiate(from storyboard: Storyboard) -> UIViewController
    static func instantiateInitialViewController(from storyboard: Storyboard) -> UIViewController
}

extension StoryboardInstantiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static func instantiate(from storyboard: Storyboard) -> Self {
        return UIStoryboard.storyboard(storyboard: storyboard).instantiateViewController()
    }
    
    static func instantiateInitialViewController(from storyboard: Storyboard) -> Self {
        return UIStoryboard.storyboard(storyboard: storyboard).instantiateInitialViewController()
    }
}

extension UIViewController: StoryboardInstantiable { }

extension UIStoryboard {
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
    
    class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.rawValue, bundle: bundle)
    }
    
    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Could not find view controller with name \(T.storyboardIdentifier)")
        }
        
        return viewController
    }
    
    func instantiateInitialViewController<T: UIViewController>() -> T {
        guard let viewController = instantiateInitialViewController() as? T else {
            fatalError("Could not find iniital view controller in storyboard: \(self.description)")
        }
        
        return viewController
    }
}

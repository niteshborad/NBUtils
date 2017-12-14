//
//  AppManager.swift
//
//  Created by Nitesh Borad on 11/12/17.
//

import UIKit

/// class responsible for management of global level business logic of application
class AppManager {
    
    private static var window: UIWindow {
        guard let window = UIApplication.shared.delegate!.window else {
            fatalError("Window == NIL, i.e. Trying to access AppDelegate.window before setting its value.")
        }
        return window!
    }
    
    class func setRootViewController(_ viewController: UIViewController) {
        AppManager.window.rootViewController = viewController
    }
    
    class func applyTheme() {
        AppManager.window.tintColor = AppConfig.themeTintColor
    }
}

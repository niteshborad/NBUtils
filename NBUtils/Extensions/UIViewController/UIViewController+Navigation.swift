//
//  UIViewController+Navigation.swift
//  
//
//  Created by Nitesh Borad on 09/05/17.
//  Copyright © 2017 Nitesh Borad. All rights reserved.
//

import UIKit

extension UIViewController {
    
    //MARK: - Bar Buttun Items
    func barButtonItem(image: UIImage, action: Selector?) -> UIBarButtonItem {
        return UIBarButtonItem.init(image: image, style: .plain, target: self, action: action)
    }
    
    func barButtonItem(title: String, style: UIBarButtonItemStyle = .plain, action: Selector?) -> UIBarButtonItem {
        return UIBarButtonItem.init(title: title, style: style, target: self, action: action)
    }
    
    func addRightBarButton(item: UIBarButtonItem?) {
        self.navigationItem.rightBarButtonItem = item
    }
    
    func addLeftBarButton(item: UIBarButtonItem?) {
        self.navigationItem.leftBarButtonItem = item
    }
    
    //MARK: - Navigation Handling
    func setupExtendedShadow(to view: UIView) {
        // Use the layer shadow to draw a one pixel hairline under this view.
        view.layer.shadowOffset = CGSize(width: 0, height: CGFloat(1) / UIScreen.main.scale)
        view.layer.shadowRadius = 0
        
        // UINavigationBar's hairline is adaptive, its properties change with
        // the contents it overlies.  You may need to experiment with these
        // values to best match your content.
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25

    }
    
    func setupExtendedNavigationBar(with extendedView: UIView) {
        
        self.removeNavBarShadow()
        self.setupExtendedShadow(to: extendedView)
    }
    
    func removeNavBarShadow() {
        // Translucency of the navigation bar is disabled so that it matches with
        // the non-translucent background of the extension view.
        self.navigationController?.navigationBar.isTranslucent = false
        
        // The navigation bar's shadowImage is set to a transparent image.  In
        // addition to providing a custom background image, this removes
        // the grey hairline at the bottom of the navigation bar.  The
        // ExtendedNavBarView will draw its own hairline.
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    func embedInNavigationController(forPresenting: Bool = false) -> UINavigationController {
        let nav = UINavigationController.init(rootViewController: self)
        if forPresenting == true {
            self.navigationItem.leftBarButtonItem = self.barButtonItem(title: "Cancel", style: .plain, action: #selector(dismissVC))
        }
        return nav
    }
    
    
    /// dismisses view controller, regardless it contained in navigation controller or tabbar controller
    @objc func dismissVC() {
        
        if let tbc = self.tabBarController {
            tbc.dismiss(animated: true, completion: nil)
        }
        else if let nvc = self.navigationController {
            nvc.dismiss(animated: true, completion: nil)
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    /// navigates back to previous view in navigation controller, if its on root view it dismisses modally vc
    func navigateBack() {
        if let nvc = self.navigationController {
            
            if self == nvc.viewControllers.first {
                self.dismissVC()
            }
            else {
                nvc.popViewController(animated: true)
            }
        }
        else {
            print("Unable to go back!!! Reason: View Controller is not embedded in Navigation Controller.")
        }
    }
}

//
//  UIImageView+Extension.swift
//  
//
//  Created by Nitesh Borad on 27/06/17.
//  Copyright © 2017 Nitesh Borad. All rights reserved.
//

import UIKit
import AlamofireImage

extension UIImageView {
    
    /// sets image loaded from URL and shows indicator while loading
    func setImage(withURL url: URL, placeholderImage: UIImage?, completion: (() -> ())? = nil) {
        
        // add activity indicator before image loading
        let activity = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activity.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activity)
        activity.centerXYAnchor(to: self)
        activity.startAnimating()
        
        self.af_setImage(withURL: url, placeholderImage: placeholderImage) { _ in
            
            // hide and remove activity
            activity.stopAnimating()
            activity.removeFromSuperview()
            completion?()
        }
    }

}


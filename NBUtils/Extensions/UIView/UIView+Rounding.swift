//
//  UIView+Rounding.swift
//  
//
//  Created by Nitesh Borad on 08/05/17.
//  Copyright © 2017 Nitesh Borad. All rights reserved.
//

import UIKit

extension UIView {
    
    func setCornerRadius(_ value: CGFloat) {
        self.layer.cornerRadius = value
        self.layer.masksToBounds = true
    }
    
    func setBorder(width: CGFloat, color: UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    func makeCircular() {
        self.layer.cornerRadius = CGFloat(min(bounds.size.width, bounds.size.height)/2)
    }
}

//
//  UIView+Extensions.swift
//  
//
//  Created by Nitesh Borad on 06/07/17.
//  Copyright © 2017 Nitesh Borad. All rights reserved.
//

import UIKit

extension UIView {
    
    func centerXYAnchor(to view: UIView, yOffset: CGFloat = 0, leftOrRightOffset: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yOffset).isActive = true
        if let offset = leftOrRightOffset {
            self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: offset).isActive = true
        }
    }
    
    func allEdgeAnchor(to view: UIView, top: CGFloat = 0, left: CGFloat = 0, right: CGFloat = 0, bottom: CGFloat = 0) {
        view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: left).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -right).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottom).isActive = true
    }
}

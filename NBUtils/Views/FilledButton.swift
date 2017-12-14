//
//  FilledButton.swift
//
//  Created by Nitesh Borad on 11/12/17.
//  Copyright © 2017 Nitesh Borad. All rights reserved.
//

import UIKit

class FilledButton: DefaultButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    override func setup() {
        super.setup()
        
        self.backgroundColor = AppConfig.themeTintColor
        self.tintColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        let p: CGFloat = self.bounds.size.height/2
        let insets = super.contentEdgeInsets
        self.contentEdgeInsets = UIEdgeInsetsMake(insets.top, p, insets.bottom, p)
    }
}

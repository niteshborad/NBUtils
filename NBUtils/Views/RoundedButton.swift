//
//  RoundedButton.swift
//
//  Created by Nitesh Borad on 14/12/17.
//  Copyright © 2017 Nitesh Borad. All rights reserved.
//

import UIKit

class RoundedButton: FilledButton {

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
        
        self.setupShadow()
    }

    func setupShadow() {
        self.layer.shadowColor = self.backgroundColor?.cgColor
        self.layer.shadowOpacity = 0.4
        
        let r = self.layer.shadowRadius - 2
        self.layer.shadowOffset = CGSize(width: -r, height: r)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.makeCircular()
    }
    
}

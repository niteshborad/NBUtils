//
//  DefaultButton.swift

//
//  Created by Nitesh Borad on 11/12/17.
//  Copyright © 2017 Nitesh Borad. All rights reserved.
//

import UIKit

class DefaultButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    func setup() {
        let new = self.title(for: .normal)?.firstUppercasedOnly
        setTitle(new, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
}

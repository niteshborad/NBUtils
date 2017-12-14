//
//  Optional+Extension.swift
//  
//
//  Created by Nitesh Borad on 10/07/17.
//  Copyright © 2017 Nitesh Borad. All rights reserved.
//

import Foundation

extension Optional where Wrapped == Int {
    var validString: String {
        guard let value = self else { return "-" }
        let string = String(describing: value)
        return string
    }
}

extension Optional where Wrapped == String {
    var validString: String {
        guard let value = self, !value.isEmpty else {return "-"}
        let string = String(describing: value)
        return string
    }
    
    var validOptionalString: String? {
        guard let value = self, !value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {return nil}
        return self
    }
    
    func validString(defaultValue: String) -> String {
        guard let value = self, !value.isEmpty else { return defaultValue }
        let string = String(describing: value)
        return string
    }
}

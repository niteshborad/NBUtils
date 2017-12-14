//
//  Date+Extensions.swift
//  
//
//  Created by Nitesh Borad on 06/07/17.
//  Copyright © 2017 Nitesh Borad. All rights reserved.
//

import Foundation

extension Date {
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

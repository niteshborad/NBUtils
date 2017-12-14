//
//  URL+Extensions.swift
//  
//
//  Created by Nitesh Borad on 06/07/17.
//  Copyright © 2017 Nitesh Borad. All rights reserved.
//

import Foundation

extension URL {
    
    var fileName: String {
        return self.deletingPathExtension().lastPathComponent
    }
    
    var fileExtension: String {
        return self.pathExtension
    }
    
    var fileNameWithExtension: String {
        return fileName.appending(".").appending(fileExtension)
    }
    
}

//
//  String+Extension.swift
//  
//
//  Created by Nitesh Borad on 24/04/17.
//  Copyright © 2017 Nitesh Borad. All rights reserved.
//

import UIKit

extension String {
    
    static let attributedTextFontSize: CGFloat = 15
    static let attributedTextFontFamily = "Helvetica"
    
    //MARK: - CSV
    static func csv(from strings:[String]) -> String {
        return strings.joined(separator: csvSeparator)
    }
    
    //MARK: - Validations
    var isValidTextEntry: Bool {
        let trimmedSelf = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return trimmedSelf.isEmpty == false
    }
    
    var validOptionalString: String? {
        guard !(self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) else {return nil}
        return self
    }
    
    var isValidEmailAddress: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,})$", options: .caseInsensitive)
            let result =  regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
            return result
        } catch {
            return false
        }
    }
    
    var isValidPhoneNumber: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[\\+]?[0-9.-]+", options: .caseInsensitive)
            let result = regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.init(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
            return result
        } catch {
            return false
        }
    }
    
    var abbrevation: String {
        if self.count >= 2 {
            let start = self.startIndex
            let end = self.index(start, offsetBy: 2)
            return self[start..<end].uppercased()
        }
        return ""
    }
    
    func isEqualIgnoringCases(_ str: String?) -> Bool {
        guard let str = str else {
            return false
        }
        return self.lowercased() == str.lowercased()
    }
    
    var firstUppercasedOnly: String {
        let lower = self.lowercased()
        guard let first = lower.first else { return "" }
        
        return String(first).uppercased() + lower.dropFirst()
    }
    
    //MARK: - Yes or No
    var boolValue: Bool {
        return self.isEqualIgnoringCases(String.yes)
    }
    
    static func yesOrNo(_ bool: Bool) -> String {
        return bool ? yes : no
    }
    
    //MARK: - Attributed String
    var htmlToAttributedString: NSAttributedString? {
        let font = UIFont.systemFont(ofSize: String.attributedTextFontSize)
        return attributedString(with: font)
    }
    
    var htmlToString: String? {
        return htmlToAttributedString?.string
    }
    
    func attributedString(font:UIFont? = nil, completion: @escaping (NSAttributedString?) -> Void) {
        DispatchQueue.main.async {
            completion(self.attributedString(with: font))
        }
    }
    
    func attributedString(with font:UIFont? = nil) -> NSAttributedString? {
        var customSelf = self
        if let font = font {
            let family = String.attributedTextFontFamily
            let size = font.pointSize

            customSelf = "<span style=\"font-family: \(family); font-size: \(size)\";>\(customSelf)</span>"
        }
        
        guard let data = customSelf.data(using: String.Encoding.unicode) else {
            print("Unable to decode data from html string: \(self)")
            return nil
        }
        
        if let attributedString = try? NSAttributedString(data: data,
                                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                                          documentAttributes: nil)  {
            return attributedString
        }
        else {
            print("Unable to create attributed string from html string: \(self)")
            return nil
        }
    }
}

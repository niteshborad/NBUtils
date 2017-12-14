//
//  UIAlertController+Helpers.swift
//  
//
//  Created by Nitesh Borad on 21/04/17.
//  Copyright © 2017 Nitesh Borad. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    func addAction(title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)? = nil) {
        let alertAction = UIAlertAction(title: title, style: style, handler: handler)
        self.addAction(alertAction)
    }
    
    class func alert(title: String, message: String? = nil, style: UIAlertControllerStyle = .alert, action: UIAlertAction? = nil, cancelAction: UIAlertAction? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        if let cancel = cancelAction {
            alertController.addAction(cancel)
        }
        else {
            alertController.addAction(title: "Ok", style: .cancel)
        }
        
        if let actionUnwrapped = action {
            alertController.addAction(actionUnwrapped)
        }

        return alertController
    }
    
    class func alert(title: String, message: String? = nil, confirmationHandler: @escaping ((Bool)-> Void)) -> UIAlertController {
        
        let cancelAction = UIAlertAction(title: "No", style: .cancel) { _ in
            confirmationHandler(false)
        }
        
        let alert = UIAlertController.alert(title: title, message: message, cancelAction: cancelAction)
        alert.addAction(title: "Yes", style: .default) { (action:UIAlertAction) in
            confirmationHandler(true)
        }
        return alert
    }
    
    class func alert(title: String, message: String? = nil, field: UITextField, textValidator: ((String) -> Bool)? = nil, actionTitle: String, handler:@escaping ((Bool, String) -> Void)) -> UIAlertController {
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        let alert = UIAlertController.alert(title: title, message: message, cancelAction: cancelAction)
        alert.addTextField { (toField) in
            toField.text = field.text
            toField.placeholder = field.placeholder
            toField.keyboardType = field.keyboardType
            toField.delegate = field.delegate
        }
        
        let additionalAction = UIAlertAction(title: actionTitle, style: .default, handler: { _ in
            let enteredtext = alert.textFields?.first?.text ?? ""
            let defaultValidator: ((String) -> Bool) = { text in return text.isValidTextEntry }
            let isValid = textValidator?(enteredtext) ?? defaultValidator(enteredtext)
            handler(isValid, enteredtext)
        })
        alert.addAction(additionalAction)
        
        return alert
    }
}

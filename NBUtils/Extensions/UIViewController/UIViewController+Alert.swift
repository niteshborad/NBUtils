//
//  UIViewController+Alert.swift
//  
//
//  Created by Nitesh Borad on 21/04/17.
//  Copyright © 2017 Nitesh Borad. All rights reserved.
//

import UIKit

//MARK: - Alert
extension UIViewController {
    
    internal func presentAlert(_ alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String? = "") {
        let alert = UIAlertController.alert(title: title, message: message)
        presentAlert(alert)
    }
    
    func showAlert(title: String, message: String?, action: UIAlertAction? = nil, cancelAction: UIAlertAction? = nil) {
        let alert = UIAlertController.alert(title: title, message: message, action: action, cancelAction: cancelAction)
        presentAlert(alert)
    }
    
    func showAlert(title: String, message: String?, confirmationHandler: @escaping ((Bool)-> Void)) {
        let alert = UIAlertController.alert(title: title, message: message, confirmationHandler: confirmationHandler)
        presentAlert(alert)
    }
    
    func showAlert(error: NSError, action: UIAlertAction? = nil) {
        showAlert(title: error.localizedDescription, message: error.localizedFailureReason, cancelAction: action)
    }
    
    func showAlert(title: String = "", attributedMessage: NSAttributedString) {
        let alert = UIAlertController.alert(title: "\(title)\n")
        alert.setValue(attributedMessage, forKey: "attributedMessage")
        presentAlert(alert)
    }
    
    func showAlert(title: String, message: String? = nil, field: UITextField, textValidator: ((String) -> Bool)?, errorMessage: String?, actionTitle: String, handler:@escaping ((String) -> Void)) {
        let alert = UIAlertController.alert(title: title, message: message, field: field, textValidator: textValidator, actionTitle: actionTitle) { (isValid, enteredText) in
            if isValid == false {
                if let msg = errorMessage {
                    self.showAlert(title: "Try Again!", message: msg)
                }
            }
            else {
                handler(enteredText)
            }
        }
        presentAlert(alert)
    }
}

//MARK: - Action Sheet
extension UIViewController {
    
    func showActionSheet(title: String, options: [String], selectedIndex: Int? = nil, handler: @escaping ((Int?) -> Void)) {
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("User canceled action sheet.")
            handler(nil)
        }

        let sheet = UIAlertController.alert(title: title, style: .actionSheet, cancelAction: cancelAction)
        for option in options {
            let index: Int? = options.index(of: option)
            var title = option
            if (selectedIndex != nil && index == selectedIndex) {
                title = "    \(option) \u{2713}"
            }
            
            let action = UIAlertAction.init(title: title, style: .default, handler: { _ in
                if let index = index {
                    print("User selected action sheet option at index: \(index); '\(option))'.")
                    handler(index)
                }
                else {
                    print("Error!!! User selected action sheet option at Unknown index).")
                }
            })
            sheet.addAction(action)
        }
        presentAlert(sheet)
    }
}


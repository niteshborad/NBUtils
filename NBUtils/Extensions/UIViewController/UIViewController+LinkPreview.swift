//
//  UIViewController+Preview.swift
//  
//
//  Created by Nitesh Borad on 23/08/17.
//  Copyright © 2017 Nitesh Borad. All rights reserved.
//

import UIKit
import SafariServices

extension UIViewController {
    
    func previewWebLink(_ link: String, presentModally: Bool = false) {
        guard let sfVC = safariViewController(link) else {
            print("Unable open link: \(link). Link might be invalid/corrupted.)")
            return
        }
        
        if presentModally {
            self.present(sfVC, animated: true, completion: nil)
        }
        else {
            self.navigationController?.pushViewController(sfVC, animated: true)
        }
    }
    
    func safariViewController(_ webLink: String) -> SFSafariViewController? {
        if let url = URL(string: webLink) {
            let sfViewController = SFSafariViewController(url: url)
            if #available(iOS 10.0, *) {
                sfViewController.preferredControlTintColor = UIApplication.shared.delegate?.window??.tintColor
            } else {
                // Fallback on earlier versions
            }
            return sfViewController
        }
        else {
            return nil
        }
    }
}

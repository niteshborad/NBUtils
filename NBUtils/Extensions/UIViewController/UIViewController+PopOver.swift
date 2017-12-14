//
//  UIViewController+PopOver.swift
//  
//
//  Created by Nitesh Borad on 03/08/17.
//  Copyright © 2017 Nitesh Borad. All rights reserved.
//

import UIKit

extension UIViewController: UIPopoverPresentationControllerDelegate {
    
    func showPopOver(_ viewController: UIViewController, in size: CGSize, from sourceView: UIView, anchor sourceRect: CGRect? = nil, showArrow: Bool = true) {
        viewController.modalPresentationStyle = .popover
        viewController.preferredContentSize = size
        viewController.popoverPresentationController?.delegate = self
        viewController.popoverPresentationController?.sourceView = sourceView
        viewController.popoverPresentationController?.sourceRect = sourceRect ?? .zero
        viewController.popoverPresentationController?.permittedArrowDirections = showArrow ? .any : UIPopoverArrowDirection(rawValue: 0)
        viewController.popoverPresentationController?.containerView?.backgroundColor = UIColor.gray
        self.present(viewController, animated: true, completion: nil)
    }
    
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

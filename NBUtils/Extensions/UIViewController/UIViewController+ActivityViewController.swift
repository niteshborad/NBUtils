//
//  UIViewController+ActivityViewController.swift
//  
//
//  Created by Nitesh Borad on 02/06/17.
//  Copyright © 2017 Nitesh Borad. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func share(activityItems: [Any], applicationActivities: [UIActivity]?) {
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        
            activityViewController.excludedActivityTypes = [UIActivityType.addToReadingList,
                                                            UIActivityType.airDrop,
                                                            UIActivityType.assignToContact,
                                                            UIActivityType.postToFlickr,
                                                            UIActivityType.postToVimeo,
                                                            UIActivityType.postToWeibo,
                                                            UIActivityType.saveToCameraRoll]
        
        self.present(activityViewController, animated: true, completion: nil)
    }
}

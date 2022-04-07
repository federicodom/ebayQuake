//
//  UIViewController+Ext.swift
//  eBayQuake
//
//  Created by Federico Dominguez on 05/04/2022.
//

import UIKit


extension UIViewController {
    
    func presentAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.modalPresentationStyle = .overFullScreen
            alertController.modalTransitionStyle = .crossDissolve
            alertController.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

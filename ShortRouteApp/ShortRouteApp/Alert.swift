//
//  Alert.swift
//  ShortRouteApp
//
//  Created by Александр Савков on 30.12.21.
//

import UIKit

extension UIViewController {
    
    func alertAddAdress(title: String, placeholder: String, complitionHandler: @escaping (String) -> Void) {
        
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Ok", style: .default) { (action) in
            let textField = alertController.textFields?.first
            guard let text = textField?.text else { return }
            complitionHandler(text)
        }
        alertController.addTextField { (textF) in
            textF.placeholder = placeholder
        }
        let alertCancel = UIAlertAction(title: "Отмена", style: .default) { (_) in }
        
        alertController.addAction(alertOk)
        alertController.addAction(alertCancel)
        
        present(alertController, animated: true, completion: nil)
    }
    func alertError(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(alertOk)
        present(alertController, animated: true, completion: nil)
    }
    
}



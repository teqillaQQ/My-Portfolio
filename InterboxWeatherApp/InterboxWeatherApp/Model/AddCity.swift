//
//  AddCity.swift
//  InterboxWeatherApp
//
//  Created by Александр Савков on 28.12.21.
//

import UIKit

extension UIViewController {
    func allerCity(name: String, placeholder: String, completionHandler: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "OK", style: .default) { (action) in
            let textFields = alertController.textFields?.first
            guard let text = textFields?.text else{ return }
            completionHandler(text)
        }
        alertController.addTextField { (textF) in
            textF.placeholder = placeholder
        }
        
        let alertCancel = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        alertController.addAction(alertOk)
        alertController.addAction(alertCancel)
        present(alertController, animated: true, completion: nil)
    }
}

//
//  ViewController.swift
//  CurrencyConverterApp
//
//  Created by Александр Савков on 11.01.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJSON()
    }
    
    func fetchJSON() {
        
        let stringUrl = "https://open.er-api.com/v6/latest"
        guard let url = URL(string: stringUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            guard let safeData = data else { return }
            
            do {
                let results = try JSONDecoder().decode(ExchangeRates.self, from: safeData)
                print(results.rates)
            } catch {
                print(error)
            }
        }.resume()
    }
}


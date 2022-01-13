//
//  ViewController.swift
//  SavkovTestAppForITSPartner
//
//  Created by Александр Савков on 10.01.22.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        fetchWeather()
        
    }
    let apyKey = "30dmm7tidg2yte70v75v955j0iunypc9ck9n1dqw"
    func fetchWeather() {
        
        let urlString = "https://json-generator.com/api/json/get/clyWAUbaxu?indent=2"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            let people = try? JSONDecoder().decode(PeopleData.self, from: data)
            print(String(data: data, encoding: .utf8)!)
            print(people?.age ?? 22)
        }
        task.resume()
    }

}


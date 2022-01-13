//
//  ChoiceCurrencyVC.swift
//  CurrencyConverter
//
//  Created by Александр Савков on 11.01.22.
//

import UIKit

class ChoiceCurrencyVC: UIViewController {

    let vc = ViewController()
    
    let buttonBYN: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("BYN", for: .normal)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonEUR: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("EUR", for: .normal)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonRUB: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("RUB", for: .normal)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonUSD: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("USD", for: .normal)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 0.7, alpha: 0.5)
        setConstrains()
        buttonBYN.addTarget(self, action: #selector(choiceBYN), for: .touchUpInside)
        buttonEUR.addTarget(self, action: #selector(choiceEUR), for: .touchUpInside)
        buttonRUB.addTarget(self, action: #selector(choiceRUB), for: .touchUpInside)
        buttonUSD.addTarget(self, action: #selector(choiceUSD), for: .touchUpInside)
    }
    
    private let codeBYN = "BYN"
    private let codeUSD = "USD"
    private let codeEUR = "EUR"
    private let codeRUB = "RUB"
    
    var buttonOneTupped = false
    var buttonTwoTupped = false
    
    @objc func choiceBYN() {
        if buttonOneTupped {
            vc.firstCurrent = codeBYN
            vc.currencyPair.append(codeBYN)
            buttonOneTupped = false
        } else if buttonTwoTupped {
            vc.secondCurrent = codeBYN
            buttonOneTupped = false
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func choiceEUR() {
        if buttonOneTupped {
            vc.firstCurrent = codeEUR
            buttonOneTupped = false
        } else if buttonTwoTupped {
            vc.secondCurrent = codeEUR
            buttonOneTupped = false
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func choiceRUB() {
        if buttonOneTupped {
            vc.firstCurrent = codeRUB
            buttonOneTupped = false
        } else if buttonTwoTupped {
            vc.secondCurrent = codeRUB
            buttonOneTupped = false
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func choiceUSD() {
        if buttonOneTupped {
            vc.firstCurrent = codeUSD
            buttonOneTupped = false
        } else if buttonTwoTupped {
            vc.secondCurrent = codeUSD
            buttonOneTupped = false
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ChoiceCurrencyVC {
    func setConstrains() {
        
        view.addSubview(buttonBYN)
        NSLayoutConstraint.activate([
            buttonBYN.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            buttonBYN.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonBYN.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            buttonBYN.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15)
        ])
        
        view.addSubview(buttonEUR)
        NSLayoutConstraint.activate([
            buttonEUR.topAnchor.constraint(equalTo: buttonBYN.topAnchor, constant: 100),
            buttonEUR.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonEUR.widthAnchor.constraint(equalTo: buttonBYN.widthAnchor),
            buttonEUR.heightAnchor.constraint(equalTo: buttonBYN.heightAnchor)
        ])
        
        view.addSubview(buttonRUB)
        NSLayoutConstraint.activate([
            buttonRUB.topAnchor.constraint(equalTo: buttonEUR.topAnchor, constant: 100),
            buttonRUB.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonRUB.widthAnchor.constraint(equalTo: buttonBYN.widthAnchor),
            buttonRUB.heightAnchor.constraint(equalTo: buttonBYN.heightAnchor)
        ])
        
        view.addSubview(buttonUSD)
        NSLayoutConstraint.activate([
            buttonUSD.topAnchor.constraint(equalTo: buttonRUB.topAnchor, constant: 100),
            buttonUSD.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonUSD.widthAnchor.constraint(equalTo: buttonBYN.widthAnchor),
            buttonUSD.heightAnchor.constraint(equalTo: buttonBYN.heightAnchor)
        ])
    }
}

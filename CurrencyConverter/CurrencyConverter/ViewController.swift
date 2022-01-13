//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Александр Савков on 11.01.22.
//

import UIKit


//UIColor(red: 0.8, green: 0.1, blue: 0.5, alpha: 1)


class ViewController: UIViewController {
    
    let textFieldOne: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let changeCurrencyOneButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("Change currency", for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let textFieldTwo: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let changeCurrencySecondButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("Change currency", for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let flagLabelOne: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let flagLabelTwo: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 0.7, alpha: 0.5)
        setConstrains()
        fetchJSON()
        changeCurrencyOneButton.addTarget(self, action: #selector(changeCurrencyOneButtonTupped), for: .touchUpInside)
        changeCurrencySecondButton.addTarget(self, action: #selector(changeCurrencySecondButtonTupped), for: .touchUpInside)
        textFieldOne.addTarget(self, action: #selector(updatetextFieldOne), for: .editingChanged)
        textFieldTwo.addTarget(self, action: #selector(updatetextFieldTwo), for: .editingChanged)
        flagLabelOne.text = firstCurrent
        flagLabelTwo.text = secondCurrent
    }
    
    
    // MARK: - Propetries
    var currencyCode: [String] = []
    var values: [Double] = []
    var activCurency = 0.0
    var firstCurrent = "BYN"
    var secondCurrent = "USD"
    //    var firstCurrent: String?
    //    var secondCurrent: String?
    enum FlagOfCountry {
        case 🇧🇾
        case 🇺🇸
        case 🇷🇺
        case 🇪🇺
    }
    lazy var currencyPair = ["", ""]
    
    
    // MARK: - Method
    
    
    @objc func updatetextFieldOne(input: Double) {
        guard let amountText = textFieldOne.text, let theAmountText = Double(amountText) else { return }
        if textFieldOne.text != "" {
            let total = theAmountText * activCurency
            textFieldTwo.text = String(format: "%.2F", total)
        }
    }
    
    @objc func updatetextFieldTwo(input: Double) {
        guard let amountText = textFieldTwo.text, let theAmountText = Double(amountText) else { return }
        if textFieldTwo.text != "" {
            let total = theAmountText / activCurency
            textFieldOne.text = String(format: "%.2F", total)
        }
    }
    
    @objc func changeCurrencyOneButtonTupped() {
        let vc = ChoiceCurrencyVC()
        vc.buttonOneTupped = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func changeCurrencySecondButtonTupped() {
        let vc = ChoiceCurrencyVC()
        vc.buttonTwoTupped = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func fetchJSON() {
        let stringUrl = "https://open.er-api.com/v6/latest/\(firstCurrent)"
        guard let url = URL(string: stringUrl) else { return }
        URLSession.shared.dataTask(with: url) { [self] (data, response, error) in
            if error != nil { print(error!)
                return }
            
            guard let safeData = data else { return }
            
            do {
                let results = try JSONDecoder().decode(ExchangeRates.self, from: safeData)
                self.currencyCode.append(contentsOf: results.rates.keys)
                self.values.append(contentsOf: results.rates.values)
                
                let index = self.currencyCode.firstIndex(where: { $0 == self.secondCurrent })
                activCurency = values[index!]
                print("\(values[index!])")
                
            } catch {
                print(error)
            }
        }.resume()
    }
}


extension ViewController {
    func setConstrains() {
        
        view.addSubview(textFieldOne)
        NSLayoutConstraint.activate([
            textFieldOne.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            textFieldOne.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldOne.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            textFieldOne.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1)
        ])
        
        view.addSubview(changeCurrencyOneButton)
        NSLayoutConstraint.activate([
            changeCurrencyOneButton.topAnchor.constraint(equalTo: textFieldOne.topAnchor, constant: 100),
            changeCurrencyOneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeCurrencyOneButton.widthAnchor.constraint(equalTo: textFieldOne.widthAnchor),
            changeCurrencyOneButton.heightAnchor.constraint(equalTo: textFieldOne.heightAnchor)
        ])
        
        view.addSubview(textFieldTwo)
        NSLayoutConstraint.activate([
            textFieldTwo.topAnchor.constraint(equalTo: changeCurrencyOneButton.topAnchor, constant: 200),
            textFieldTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldTwo.widthAnchor.constraint(equalTo: textFieldOne.widthAnchor),
            textFieldTwo.heightAnchor.constraint(equalTo: textFieldOne.heightAnchor)
        ])
        
        view.addSubview(changeCurrencySecondButton)
        NSLayoutConstraint.activate([
            changeCurrencySecondButton.topAnchor.constraint(equalTo: textFieldTwo.topAnchor, constant: 100),
            changeCurrencySecondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeCurrencySecondButton.widthAnchor.constraint(equalTo: textFieldOne.widthAnchor),
            changeCurrencySecondButton.heightAnchor.constraint(equalTo: textFieldOne.heightAnchor)
        ])
        
        view.addSubview(flagLabelOne)
        NSLayoutConstraint.activate([
            flagLabelOne.topAnchor.constraint(equalTo: textFieldOne.topAnchor),
            flagLabelOne.leadingAnchor.constraint(equalTo: textFieldOne.trailingAnchor),
            flagLabelOne.widthAnchor.constraint(equalTo: textFieldOne.widthAnchor, multiplier: 0.3),
            flagLabelOne.heightAnchor.constraint(equalTo: textFieldOne.heightAnchor)
        ])
        
        view.addSubview(flagLabelTwo)
        NSLayoutConstraint.activate([
            flagLabelTwo.topAnchor.constraint(equalTo: textFieldTwo.topAnchor),
            flagLabelTwo.leadingAnchor.constraint(equalTo: textFieldTwo.trailingAnchor),
            flagLabelTwo.widthAnchor.constraint(equalTo: textFieldOne.widthAnchor, multiplier: 0.3),
            flagLabelTwo.heightAnchor.constraint(equalTo: textFieldOne.heightAnchor)
        ])
    }
}

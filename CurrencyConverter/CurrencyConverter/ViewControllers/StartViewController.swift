//
//  StartViewController.swift
//  CurrencyConverter
//
//  Created by Александр Савков on 11.01.22.
//

import UIKit

class StartViewController: UIViewController {
    
    // MARK: - Propetries
    let netWork = NetWorkManager()
    let FlagOfCountry = [
        "BYN": "🇧🇾",
        "USD": "🇺🇸",
        "RUB": "🇷🇺",
        "EUR": "🇪🇺"]
    
    var firstCurrent = "BYN" {
        didSet {
            netWork.fetchJSON(firstCurrent: firstCurrent) { [weak self] result in
                guard let self = self else { return }
                self.currencyCode.removeAll()
                self.values.removeAll()
                
                self.currencyCode.append(contentsOf: result.rates.keys)
                self.values.append(contentsOf: result.rates.values)
                
                let index = self.currencyCode.firstIndex(where: { $0 == self.secondCurrent })
                self.activCurency = self.values[index!]
                print("\(self.values[index!])")
                DispatchQueue.main.async {
                    self.reloadData()
                }
            }
        }
    }
    var secondCurrent = "USD" {
        didSet {
            let index = self.currencyCode.firstIndex(where: { $0 == self.secondCurrent })
            self.activCurency = self.values[index!]
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    var currencyCode: [String] = []
    var values: [Double] = []
    var activCurency = 0.0
    
    
    let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 0.7, alpha: 0)
        textLabel.textAlignment = .center
        textLabel.text = "Currency converter"
        textLabel.font = .boldSystemFont(ofSize: 28)
        textLabel.textColor = .white
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    let textFieldOne: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.font = .boldSystemFont(ofSize: 25)
        textField.minimumFontSize = 12
        textField.adjustsFontSizeToFitWidth = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(updatetextFieldOne), for: .editingChanged)
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
        button.addTarget(self, action: #selector(changeCurrencyOneButtonTupped), for: .touchUpInside)
        return button
    }()
    
    let textFieldTwo: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.font = .boldSystemFont(ofSize: 25)
        textField.minimumFontSize = 12
        textField.adjustsFontSizeToFitWidth = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(updatetextFieldTwo), for: .editingChanged)

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
        button.addTarget(self, action: #selector(changeCurrencySecondButtonTupped), for: .touchUpInside)
        return button
    }()
    
    let flagLabelOne: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 21)
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let flagLabelTwo: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 21)
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 0.7, alpha: 0.5)
        setConstrains()
        netWork.fetchJSON(firstCurrent: firstCurrent) { [weak self] result in
            guard let self = self else { return }
            self.currencyCode.append(contentsOf: result.rates.keys)
            self.values.append(contentsOf: result.rates.values)
            
            let index = self.currencyCode.firstIndex(where: { $0 == self.secondCurrent })
            self.activCurency = self.values[index!]
            print("\(self.values[index!])")
        }
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
        
    // MARK: - Method
    
    @objc func updatetextFieldOne() {
        guard let amountText = textFieldOne.text, let theAmountText = Double(amountText) else { return textFieldTwo.text = ""
        }
        if textFieldOne.text != "" {
            let total = theAmountText * activCurency
            textFieldTwo.text = String(format: "%.2F", total)
        }
    }
    
    @objc func updatetextFieldTwo() {
        guard let amountText = textFieldTwo.text, let theAmountText = Double(amountText) else { return
            textFieldOne.text = ""
        }
        if textFieldTwo.text != "" {
            let total = theAmountText / activCurency
            textFieldOne.text = String(format: "%.2F", total)
        }
    }
    
    @objc func changeCurrencyOneButtonTupped() {
        let vc = CurrencyViewController()
        vc.closure = { [weak self] item in
            guard let self = self else { return }
            self.firstCurrent = item
        }
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc func changeCurrencySecondButtonTupped() {
        let vc = CurrencyViewController()
        vc.closure = { [weak self] item in
            guard let self = self else { return }
            self.secondCurrent = item
        }
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func reloadData() {
        flagLabelOne.text = firstCurrent + " " + FlagOfCountry[firstCurrent]!
        flagLabelTwo.text = secondCurrent + " " + FlagOfCountry[secondCurrent]!
        updatetextFieldOne()
        updatetextFieldTwo()
    }

}

extension StartViewController {
    func setConstrains() {
        
        view.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            textLabel.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.20)
        ])
        
        view.addSubview(textFieldOne)
        NSLayoutConstraint.activate([
            textFieldOne.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 75),
            textFieldOne.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor),
            textFieldOne.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            textFieldOne.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18)
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
            textFieldTwo.topAnchor.constraint(equalTo: changeCurrencyOneButton.topAnchor, constant: 150),
            textFieldTwo.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor),
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
            flagLabelOne.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            flagLabelOne.heightAnchor.constraint(equalTo: textFieldOne.heightAnchor)
        ])
        
        view.addSubview(flagLabelTwo)
        NSLayoutConstraint.activate([
            flagLabelTwo.topAnchor.constraint(equalTo: textFieldTwo.topAnchor),
            flagLabelTwo.leadingAnchor.constraint(equalTo: textFieldTwo.trailingAnchor),
            flagLabelTwo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            flagLabelTwo.heightAnchor.constraint(equalTo: textFieldOne.heightAnchor)
        ])
    }
}

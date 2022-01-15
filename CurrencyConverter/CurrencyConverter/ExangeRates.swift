//
//  ExangeRates.swift
//  CurrencyConverter
//
//  Created by Александр Савков on 11.01.22.
//

import Foundation

var curentyArray = ["BYN", "EUR", "RUB", "USD"]

struct ExchangeRates: Codable {
    let rates: [String: Double]
}

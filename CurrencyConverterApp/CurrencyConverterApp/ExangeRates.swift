//
//  ExangeRates.swift
//  CurrencyConverterApp
//
//  Created by Александр Савков on 11.01.22.
//

import Foundation

struct ExchangeRates: Codable {
    let rates: [String: Double]
}

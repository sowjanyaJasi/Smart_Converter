//
//  CurrencyModel.swift
//  Smart Converter
//
//  Created by Sowjanya on 28/12/24.
//

import Foundation

struct CurrencyModel: Codable {
    let disclaimer: String
    let license: String
    let timestamp: Int
    let base: String
    let rates: [String: Double]
}

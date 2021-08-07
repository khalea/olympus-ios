//
//  Stocks.swift
//  Olympus
//
//  Created by Khalea Berry on 8/6/21.
//
// Adjust to Tradier data

import Foundation



let stocks = [
    BasicStock("DOCN", "DOCN Call Option $55.00 Aug 20, 2021", 55.00, 2.50),
    BasicStock("AAPL", "AAPL Call Option $147.00 Aug 13, 2021", 147.00, 96.00),
    BasicStock("SQ", "SQ Call Option $275.00 Aug 20, 2021", 275.00, 8.75),
    BasicStock("AMD", "AMD Call Option $111.00 Sep 03, 2021", 111.00, 5.35)
]

/**
    BasicStock is a struct enumerating the data needed to display a stock on the homepage.
 */
struct BasicStock: Codable, Identifiable {
    var id = UUID()
    var symbol: String
    var contractName: String
    var strike: Float
    var close: Float
    
    init(_ symbol: String, _ contractName: String, _ strike: Float, _ close: Float) {
        self.symbol = symbol
        self.contractName = contractName
        self.strike = strike
        self.close = close
    }
}

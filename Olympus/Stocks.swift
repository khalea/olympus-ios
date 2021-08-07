//
//  Stocks.swift
//  Olympus
//
//  Created by Khalea Berry on 8/6/21.
//

import Foundation



let stocks = [
    BasicStock(ticker: "DOCN", contractName: "DOCN Call Option $55.00 Aug 20, 2021", strike: 55.00, close: 2.50),
    BasicStock(ticker: "AAPL", contractName: "AAPL Call Option $147.00 Aug 13, 2021", strike: 147.00, close: 96.00),
    BasicStock(ticker: "SQ", contractName: "SQ Call Option $275.00 Aug 20, 2021", strike: 275.00, close: 8.75),
    BasicStock(ticker: "AMD", contractName: "AMD Call Option $111.00 Sep 03, 2021", strike: 111.00, close: 5.35)
]

/**
    BasicStock is a struct enumerating the data needed to display a stock on the homepage.
 */
struct BasicStock: Codable, Identifiable {
    var id = UUID()
    var ticker: String
    var contractName: String
    var strike: Float
    var close: Float
    
    init(ticker: String, contractName: String, strike: Float, close: Float) {
        self.ticker = ticker
        self.contractName = contractName
        self.strike = strike
        self.close = close
    }
}

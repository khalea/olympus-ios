//
//  Options.swift
//  Olympus
//
//  Created by Khalea Berry on 8/7/21.
//

import Foundation

struct BasicOption: Codable, Identifiable {
    
    var id = UUID()
    var underlying: String
    var description: String
    var optionType: String
    var expiry: String
    var strike: Float
    var bid: Float
    var ask: Float
    var mid: Float
    
    init(_ underlying: String, _ description: String, _ optionType: String, _ expiry: String, _ strike: Float, _ bid: Float, _ ask: Float) {
        
        self.underlying = underlying
        self.description = description
        self.optionType = optionType
        self.expiry = expiry
        self.strike = strike
        self.bid = bid
        self.ask = ask
        self.mid = Float((self.bid+self.ask)/2)
    }
}

var options = [
    BasicOption("DOCN", "DOCN Call Option $40.00 Aug 20, 2021", "Call", "08-20-2021", 40.00, 13.80, 14.70),
    BasicOption("DOCN", "DOCN Call Option $45.00 Aug 20, 2021", "Call", "08-20-2021", 45.00, 8.50, 10.60),
    BasicOption("DOCN", "DOCN Call Option $50.00 Aug 20, 2021", "Call", "08-20-2021", 50.00, 4.60, 5.80),
    BasicOption("DOCN", "DOCN Call Option $55.00 Aug 20, 2021", "Call", "08-20-2021", 55.00, 2.40, 2.60),
    BasicOption("DOCN", "DOCN Call Option $60.00 Aug 20, 2021", "Call", "08-20-2021", 60.00, 1.20, 1.40),
    BasicOption("DOCN", "DOCN Call Option $65.00 Aug 20, 2021", "Call", "08-20-2021", 65.00, 0.60, 1.00)
]

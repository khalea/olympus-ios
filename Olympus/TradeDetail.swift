//
//  TradeDetail.swift
//  Olympus
//
//  Created by Khalea Berry on 8/6/21.
//

import SwiftUI

struct TradeDetail: View {
    var stock: BasicStock
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Trade Detail")
                .font(.title2)
                .fontWeight(.heavy)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack(alignment: .leading) {
                
                Text(stock.contractName)
                    .font(.headline)
                    
                HStack {
                    Text("Strike: $"+String(format: "%.2f", stock.strike))
                        .fontWeight(.light)
                    Spacer()
                    Text("Close: $"+String(format: "%.2f", stock.close))
                        .fontWeight(.light)
                    Spacer()
                }
                .padding(.top, 4.0)
            }
            .padding(.vertical, 2.0)
            
                
            Spacer()
        }
        .navigationTitle(stock.ticker)
        .navigationBarTitleDisplayMode(.large)
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        
    }
}

struct TradeDetail_Previews: PreviewProvider {
    static var previews: some View {
        TradeDetail(stock: BasicStock(ticker: "DOCN", contractName: "DOCN Call Option $55.00 Aug 20, 2021", strike: 55.00, close: 2.50))
    }
}

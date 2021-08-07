//
//  NewTrade.swift
//  Olympus
//
//  Created by Khalea Berry on 8/6/21.
//

import SwiftUI

struct NewTrade: View {
    @State private var ticker: String = ""
    @State private var contractType: Int = 0
    @State private var buySell: Int = 0
    
    var body: some View {
        VStack {
            
            // Search
            HStack {
                TextField("ie. SQ, Twitter, etc", text: $ticker)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
                Image(systemName: "magnifyingglass")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.gray)
                    .frame(width: 22.0, height: 22.0)
            }
            .padding(.horizontal)
            
            // Pickers
            HStack {
                Picker(selection: $contractType, label: Text("Contract Type"), content: {
                    Text("Call").tag(1)
                    Text("Put").tag(2)
                })
                
                Picker(selection: $buySell, label: Text("Buy or Sell"), content: {
                    Text("Buy").tag(1)
                    Text("Sell").tag(2)
                })
            }
            .padding(.horizontal)
            .pickerStyle(SegmentedPickerStyle())
            
            // Chain
            
            List(options) { option in
                NavigationLink(destination: ContractDetail()) {
                    HStack {
                        VStack {
                            Text("$"+String(format: "%.2f", option.strike)+" \(option.optionType)")
                                .fontWeight(.bold)
                        }
                        Spacer()
                        VStack {
                            Text("$"+String(format: "%.2f", (option.bid+option.ask)/2))
                        }
                    }
                    .padding()
                }
            }
            
            Spacer()
        }
        .navigationTitle("New Trade")
        .navigationBarTitleDisplayMode(.large)
        
        
    }
}

struct NewTrade_Previews: PreviewProvider {
    static var previews: some View {
        NewTrade()
    }
}

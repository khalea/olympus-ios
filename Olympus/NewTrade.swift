//
//  NewTrade.swift
//  Olympus
//
//  Created by Khalea Berry on 8/6/21.
//

import SwiftUI

struct NewTrade: View {
    
    // User Input
    @State private var ticker: String = ""
    // Query String
    private var query: String = ""
    // Underlying Price — For ITM/OTM section divider
    @State private var underlyingPrice: Float = 54.10
    
    // Date Selection
    @State private var selectedDate: String = ""
    
    // Segmented Pickers
    @State private var contractType: Int = 0
    @State private var buySell: Int = 0
    // Colors for pickers
    @State private var typeColor: UIColor = UIColor.init(Color.black)
    @State private var sideColor: UIColor = .systemGreen
    // Custom Segmented Picker Style
    enum orderType: String, CaseIterable {
        case call = "Call"
        case put = "Put"
    }
    enum orderSide: String, CaseIterable {
        case buy = "Buy"
        case sell = "Sell"
    }
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = typeColor
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    
    
    var body: some View {
        ZStack {
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
                
                // Dates
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(dates, id: \.self) { item in
                            Button("\(item)", action: {
                                print(item)
                                self.selectedDate = String(item)
                                print(self.selectedDate)
                            })
                            .padding(.trailing)
                        }
                    }
                    .frame(height: 16.0)
                }
                .padding(.all)
                
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
                
                // Options Chain
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
        
            Spacer()
            
            VStack {
                Spacer()
                Text("\(ticker) Price: $" + String(format: "%.2f", underlyingPrice))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .padding(.all, 12.0)
                    .background(Color.green)
                    .cornerRadius(20.0)
            }
        
        }
    }
}

struct NewTrade_Previews: PreviewProvider {
    static var previews: some View {
        NewTrade()
    }
}

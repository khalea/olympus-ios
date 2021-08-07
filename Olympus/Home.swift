//
//  Home.swift
//  Olympus
//
//  Created by Khalea Berry on 8/6/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            ZStack {
                List(stocks) { item in
                    NavigationLink(destination: TradeDetail(stock: item)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.symbol)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                                HStack {
                                    Image(systemName: "arrow.up")
                                        .resizable(resizingMode: .stretch)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 12.0, height: 12.0)
                                    Text("$"+String(format: "%.2f", item.close))
                                }
                            }
                            Spacer()
                            VStack {
                                Text(item.contractName)
                                    .font(.body)
                                    .fontWeight(.light)
                                    .multilineTextAlignment(.trailing)
                            }
                        }
                        .padding(.vertical)
                    }
                }
                .navigationTitle("Olympus")
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: NewTrade()) {
                            Image(systemName: "plus.circle.fill")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.green)
                                .frame(width: 48.0, height: 48.0)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(width: 50.0, height: 50.0)
                    }
                    .padding(.horizontal, 16.0)
                }
                
            }
            .listStyle(PlainListStyle())
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24.0, height: 24.0)
                        .foregroundColor(.green)
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Image(systemName: "person.crop.circle")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 24.0, height: 24.0)
                        .foregroundColor(.green)
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

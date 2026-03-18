//
//  MarketViewModel.swift
//  CryptoTracker
//
//  Created by Lakshpurbey on 16/03/26.
//

import SwiftUI
import Combine

@MainActor
class MarketViewModel: ObservableObject {

    @Published var cryptos: [Crypto] = []
    private var symbolMap: [String: String] = [:]

    @Published var searchText = ""

    private let fetchMarket: FetchMarketUseCase
    private let streamPrices: StreamPricesUseCase


    init(fetchMarket: FetchMarketUseCase,
         streamPrices: StreamPricesUseCase) {
        self.fetchMarket = fetchMarket
        self.streamPrices = streamPrices

    }

    func load() async {

        do {
            cryptos = try await fetchMarket.execute()
            
            symbolMap = Dictionary(uniqueKeysWithValues:
                cryptos.map { ($0.symbol.uppercased() + "USDT", $0.id) }
            )
            
            startStreaming()


        } catch {

            print(error)
        }
    }
    

    var filteredCryptos: [Crypto] {

        if searchText.isEmpty {
            return cryptos
        }

        return cryptos.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    private func startStreaming() {

        let symbols = Array(symbolMap.keys) 
        
        Task {

            for await update in streamPrices.execute(symbols: symbols) {
                
                if let id = symbolMap[update.symbol],
                   let index = cryptos.firstIndex(where: { $0.id == id }) {
                    cryptos[index].price = update.price
                }
            }
        }
    }

}

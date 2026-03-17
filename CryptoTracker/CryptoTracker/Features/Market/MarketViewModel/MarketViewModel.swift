//
//  MarketViewModel.swift
//  CryptoTracker
//
//  Created by Laxmipurbey on 16/03/26.
//

import SwiftUI
import Combine

@MainActor
class MarketViewModel: ObservableObject {

    @Published var cryptos: [Crypto] = []
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

        Task {

            for await update in streamPrices.execute() {

                if let index = cryptos.firstIndex(where: {
                    $0.id == update.id
                }) {

                    cryptos[index].price = update.price
                }
            }
        }
    }

}

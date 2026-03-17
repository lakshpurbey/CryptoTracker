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

    init(fetchMarket: FetchMarketUseCase) {
        self.fetchMarket = fetchMarket
    }

    func load() async {

        do {

            cryptos = try await fetchMarket.execute()

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
}

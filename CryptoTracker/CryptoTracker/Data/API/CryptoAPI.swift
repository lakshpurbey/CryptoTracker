//
//  CryptoAPI.swift
//  CryptoTracker
//
//  Created by Lakshpurbey on 17/03/26.
//

import Foundation

class CryptoAPI {

    let client = APIClient()

    func fetchMarket() async throws -> [CryptoDTO] {

        let url = URL(
        string:"https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")!

        return try await client.request(url)
    }
}

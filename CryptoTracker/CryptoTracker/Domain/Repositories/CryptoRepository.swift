//
//  CryptoRepository.swift
//  CryptoTracker
//
//  Created by Lakshpurbey on 17/03/26.
//

protocol CryptoRepository {

    func fetchMarket() async throws -> [Crypto]
    func streamPrices(string: [String]) -> AsyncStream<TickerUpdate>

}

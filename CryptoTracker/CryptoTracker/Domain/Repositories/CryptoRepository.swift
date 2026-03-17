//
//  CryptoRepository.swift
//  CryptoTracker
//
//  Created by Laxmipurbey on 17/03/26.
//

protocol CryptoRepository {

    func fetchMarket() async throws -> [Crypto]
    func streamPrices() -> AsyncStream<CryptoPriceUpdate>

}

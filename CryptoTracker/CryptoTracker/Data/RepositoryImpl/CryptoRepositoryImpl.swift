//
//  CryptoRepositoryImpl.swift
//  CryptoTracker
//
//  Created by Laxmipurbey on 17/03/26.
//

import Foundation

class CryptoRepositoryImpl: CryptoRepository {

    private let api: CryptoAPI

    init(api: CryptoAPI) {
        self.api = api
    }

    func fetchMarket() async throws -> [Crypto] {

        let dto = try await api.fetchMarket()

        return dto.map { $0.toDomain() }
    }
}

extension CryptoRepositoryImpl {

    func streamPrices() -> AsyncStream<CryptoPriceUpdate> {

        AsyncStream { continuation in

            WebSocketManager.shared.onReceive = { update in
                continuation.yield(update)
            }

            WebSocketManager.shared.connect()

            continuation.onTermination = { _ in
                WebSocketManager.shared.disconnect()
            }
        }
    }
}

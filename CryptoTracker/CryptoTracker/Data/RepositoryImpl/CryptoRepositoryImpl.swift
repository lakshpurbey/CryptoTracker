//
//  CryptoRepositoryImpl.swift
//  CryptoTracker
//
//  Created by Lakshpurbey on 17/03/26.
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

    func streamPrices(string: [String]) -> AsyncStream<TickerUpdate> {

        AsyncStream { continuation in
            
            let ws = WebSocketManager()

            ws.onReceive = { update in
                continuation.yield(update)
            }

            ws.connect(symbols: string)

            continuation.onTermination = { _ in
                ws.disconnect()
            }
        }
    }
}


//
//  StreamPricesUseCase.swift
//  CryptoTracker
//
//  Created by Lakshpurbey on 17/03/26.
//

class StreamPricesUseCase {

    private let repository: CryptoRepository

    init(repository: CryptoRepository) {
        self.repository = repository
    }

    func execute(symbols: [String]) -> AsyncStream<TickerUpdate> {
        repository.streamPrices(string: symbols)
    }
}

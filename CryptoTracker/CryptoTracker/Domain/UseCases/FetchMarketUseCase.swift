//
//  FetchMarketUseCase.swift
//  CryptoTracker
//
//  Created by Lakshpurbey on 17/03/26.
//

class FetchMarketUseCase {

    private let repository: CryptoRepository

    init(repository: CryptoRepository) {
        self.repository = repository
    }

    func execute() async throws -> [Crypto] {
        try await repository.fetchMarket()
    }
}

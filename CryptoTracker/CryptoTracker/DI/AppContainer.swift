//
//  AppContainer.swift
//  CryptoTracker
//
//  Created by Laxmipurbey on 17/03/26.
//

class AppContainer {

    lazy var api = CryptoAPI()

    lazy var repository =
        CryptoRepositoryImpl(api: api)

    lazy var fetchMarket =
        FetchMarketUseCase(repository: repository)
    
    lazy var streamPrices =
        StreamPricesUseCase(repository: repository)
}

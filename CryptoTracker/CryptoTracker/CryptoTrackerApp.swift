//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Laxmipurbey on 16/03/26.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    
    let container = AppContainer()

    var body: some Scene {
        WindowGroup {
            MarketView(
                viewModel: MarketViewModel(
                    fetchMarket: container.fetchMarket
                )
            )
        }
    }
}

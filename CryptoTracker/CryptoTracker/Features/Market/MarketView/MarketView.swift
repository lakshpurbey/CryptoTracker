//
//  MarketView.swift
//  CryptoTracker
//
//  Created by Laxmipurbey on 17/03/26.
//

import SwiftUI

struct MarketView: View {

    @StateObject var viewModel: MarketViewModel

    var body: some View {

        NavigationStack {

            List(viewModel.filteredCryptos) { crypto in

                NavigationLink {

                    CryptoDetailView(crypto: crypto)

                } label: {

                    MarketRowView(crypto: crypto)
                }
            }
            .navigationTitle("Crypto Tracker")
            .searchable(text: $viewModel.searchText)
        }
        .task {
            await viewModel.load()
        }
    }
}

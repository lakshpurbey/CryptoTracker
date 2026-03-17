//
//  MarketRowView.swift
//  CryptoTracker
//
//  Created by Laxmipurbey on 16/03/26.
//

import SwiftUI

struct MarketRowView: View {

    let crypto: Crypto

    var body: some View {

        HStack(spacing: 16) {

            AsyncImage(url: URL(string: crypto.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 36, height: 36)

            VStack(alignment: .leading) {

                Text(crypto.name)
                    .font(.headline)

                Text(crypto.symbol.uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing) {

                Text("$\(crypto.price, specifier: "%.2f")")
                    .font(.headline)
            }
        }
        .padding(.vertical, 8)
    }
}

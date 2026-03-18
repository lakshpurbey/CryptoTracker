//
//  CryptoDetailView.swift
//  CryptoTracker
//
//  Created by Lakshpurbey on 17/03/26.
//

import SwiftUI

struct CryptoDetailView: View {

    let crypto: Crypto

    var body: some View {

        VStack(spacing: 20) {

            AsyncImage(url: URL(string: crypto.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)

            Text(crypto.name)
                .font(.largeTitle)

            Text("$\(crypto.price, specifier: "%.2f")")
                .font(.title)
                .monospacedDigit()
                .contentTransition(.numericText())
                .animation(.easeInOut(duration: 0.3), value: crypto.price)

            PriceChartView()

            Spacer()
        }
        .padding()
    }
}

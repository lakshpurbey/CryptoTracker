//
//  TradePanel.swift
//  CryptoTracker
//
//  Created by Laxmipurbey on 17/03/26.
//

import SwiftUI

struct TradePanel: View {

    @State private var amount = ""

    var body: some View {

        VStack(spacing: 12) {

            TextField("Amount", text: $amount)
                .textFieldStyle(.roundedBorder)

            HStack {

                Button("Buy") {}
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)

                Button("Sell") {}
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
            }
        }
    }
}

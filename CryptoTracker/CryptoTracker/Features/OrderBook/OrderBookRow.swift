//
//  OrderBookRow.swift
//  CryptoTracker
//
//  Created by Lakshpurbey on 17/03/26.
//

import SwiftUI

struct OrderBookRow: View {

    let price: Double
    let amount: Double
    let isBid: Bool

    var body: some View {

        HStack {

            if isBid {
                Text("\(amount)")
                Spacer()
                Text("\(price)")
                    .foregroundColor(.green)
            } else {
                Text("\(price)")
                    .foregroundColor(.red)
                Spacer()
                Text("\(amount)")
            }
        }
    }
}

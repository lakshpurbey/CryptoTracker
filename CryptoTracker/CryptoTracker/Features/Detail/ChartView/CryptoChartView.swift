//
//  CryptoChartView.swift
//  CryptoTracker
//
//  Created by Laxmipurbey on 16/03/26.
//

import Charts
import SwiftUI

struct CryptoChartView: View {

    let prices: [PricePoint]

    var body: some View {

        Chart(prices) { price in

            LineMark(
                x: .value("Time", price.time),
                y: .value("Price", price.price)
            )
            .interpolationMethod(.catmullRom)
        }
        .frame(height: 240)
    }
}

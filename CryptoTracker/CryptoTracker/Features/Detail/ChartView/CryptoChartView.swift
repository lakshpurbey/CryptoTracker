//
//  CryptoChartView.swift
//  CryptoTracker
//
//  Created by Lakshpurbey on 16/03/26.
//

import Charts
import SwiftUI

struct Candle: Identifiable {

    let id = UUID()
    let time: Date
    let open: Double
    let close: Double
    let high: Double
    let low: Double
}

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

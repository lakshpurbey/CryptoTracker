//
//  PriceChartView.swift
//  CryptoTracker
//
//  Created by Laxmipurbey on 17/03/26.
//

import SwiftUI
import Charts

struct PricePoint: Identifiable {

    let id = UUID()
    let time: Int
    let price: Double
}

struct PriceChartView: View {

    let data: [PricePoint] = (0..<20).map {
        PricePoint(time: $0, price: Double.random(in: 20000...30000))
    }

    var body: some View {

        Chart(data) {

            LineMark(
                x: .value("Time", $0.time),
                y: .value("Price", $0.price)
            )
        }
        .frame(height: 200)
    }
}

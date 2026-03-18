//
//  Untitled.swift
//  CryptoTracker
//
//  Created by Lakshpurbey on 17/03/26.
//

struct StreamResponse: Decodable {
    let data: BinanceTrade
}

struct BinanceTrade: Decodable {
    let symbol: String
    let price: String

    enum CodingKeys: String, CodingKey {
        case symbol = "s"
        case price = "p"
    }
}

struct TickerUpdate {
    let symbol: String
    let price: Double
}

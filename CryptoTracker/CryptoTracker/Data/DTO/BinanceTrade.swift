//
//  Untitled.swift
//  CryptoTracker
//
//  Created by Laxmipurbey on 17/03/26.
//

struct BinanceTrade: Decodable {

    let price: String

    enum CodingKeys: String, CodingKey {
        case price = "p"
    }
}

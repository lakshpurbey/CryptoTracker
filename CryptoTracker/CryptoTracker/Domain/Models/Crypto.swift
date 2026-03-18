//
//  Crypto.swift
//  CryptoTracker
//
//  Created by Lakshpurbey on 17/03/26.
//

import Foundation

struct Crypto: Identifiable, Codable {

    let id: String
    let name: String
    let symbol: String
    var price: Double
    let image: String
    let marketCap: Double
}

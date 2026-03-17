//
//  CryptoDTO.swift
//  CryptoTracker
//
//  Created by Laxmipurbey on 17/03/26.
//

struct CryptoDTO: Decodable {

    let id: String
    let name: String
    let symbol: String
    let current_price: Double
    let market_cap: Double
    let image: String
}

extension CryptoDTO {

    func toDomain() -> Crypto {

        Crypto(
            id: id,
            name: name,
            symbol: symbol,
            price: current_price,
            image: image,
            marketCap: market_cap
        )
    }
}

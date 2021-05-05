//
//  Coin.swift
//  CryptoCoin
//
//  Created by Luiza Negreiros Naves - LNA on 05/05/21.
//

import Foundation

struct Coin: Decodable {
    var data: [DataCoin]
}
struct DataCoin: Decodable {
    var id: String
    var name: String
    var symbol: String
    var quote: QuoteDetail
    
}

struct QuoteDetail: Decodable {
    var USD:  UsdDetail
}

struct UsdDetail: Decodable {
    var price: Decimal
    var volume_24: Decimal
    var percent_change_1h: String
    var percent_change_24h: String
    var percent_change_7d: String
    var coin_market_cap: Decimal
}


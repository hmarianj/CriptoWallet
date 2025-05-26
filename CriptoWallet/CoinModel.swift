//
//  CoinModel.swift
//  CriptoWallet
//
//  Created by MH on 17/03/2025.
//

struct CoinListResponse: Codable {
    let data: [Coin]
}

struct Coin: Codable, Identifiable, Equatable {
    let id: Int
    let symbol: String
    let name: String
    let quote: Quote?
    
    var imageUrl: String {
        "https://s2.coinmarketcap.com/static/img/coins/64x64/\(id).png"
    }
}

struct Quote: Codable, Equatable {
    let usd: USDQuote

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

struct USDQuote: Codable, Equatable {
    let percentChange24h: Double?
    let price: Double?

    enum CodingKeys: String, CodingKey {
        case percentChange24h = "percent_change_24h"
        case price
    }
}


extension Coin {
    static var bitcoinMock: Coin {
        Coin(
            id: 1,
            symbol: "BTC",
            name: "Bitcoin",
            quote: Quote.init(usd: USDQuote.init(percentChange24h: 4.474, price: 111725.00))
        )
    }
    
    static var ethereumMock: Coin {
        Coin(
            id: 2,
            symbol: "ETH",
            name: "Ethereum",
            quote: Quote.init(usd: USDQuote.init(percentChange24h: 7.396, price: 2655.91))
        )
    }
    
    static var tetherMock: Coin {
        Coin(
            id: 1027,
            symbol: "ETH",
            name: "Tether USDt",
            quote: Quote.init(usd: USDQuote.init(percentChange24h: -0.004, price: 1.000))
        )
    }
    
    static var bnbMock: Coin {
        Coin(
            id: 1839,
            symbol: "BNB",
            name: "BNB",
            quote: Quote.init(usd: USDQuote.init(percentChange24h: 1.71, price: 680.79))
        )
    }
}

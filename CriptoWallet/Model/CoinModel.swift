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
    let name: String
    let symbol: String
    let circulatingSupply: Double?
    let totalSupply: Double?
    let maxSupply: Double?
    let quote: Quote?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, quote
        case totalSupply = "total_supply"
        case circulatingSupply = "circulating_supply"
        case maxSupply = "max_supply"
    }
    
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
    let marketCap: Double?
    let volume24h: Double?
    let fullyDilutedMarketCap: Double?

    enum CodingKeys: String, CodingKey {
        case percentChange24h = "percent_change_24h"
        case marketCap = "market_cap"
        case volume24h = "volume_24h"
        case fullyDilutedMarketCap = "fully_diluted_market_cap"
        case price
    }
    
    var volumeToMarketCapRatio: Double? {
            guard let volume = volume24h, let cap = marketCap, cap != 0 else { return nil }
            return volume / cap
    }
}


extension Coin {
    static var bitcoinMock: Coin {
        Coin(
            id: 1,
            name: "Bitcoin",
            symbol: "BTC",
            circulatingSupply: 16950100.0,
            totalSupply: 16950100.0,
            maxSupply: 21000000,
            quote: Quote.init(
                usd: USDQuote.init(
                    percentChange24h: 0.518894,
                    price: 98102.89,
                    marketCap: 852164659250.2758,
                    volume24h: 7155680000,
                    fullyDilutedMarketCap: 952835089431.14
                )
            )
        )
    }
    
    static var ethereumMock: Coin {
        Coin(
            id: 2,
            name: "Bitcoin",
            symbol: "BTC",
            circulatingSupply: 16950100.0,
            totalSupply: 16950100.0,
            maxSupply: 21000000,
            quote: Quote.init(
                usd: USDQuote.init(
                    percentChange24h: 0.518894,
                    price: 98102.89,
                    marketCap: 852164659250.2758,
                    volume24h: 7155680000,
                    fullyDilutedMarketCap: 952835089431.14
                )
            )
        )
    }
    
    static var tetherMock: Coin {
        Coin(
            id: 3,
            name: "Bitcoin",
            symbol: "BTC",
            circulatingSupply: 16950100.0,
            totalSupply: 16950100.0,
            maxSupply: 21000000,
            quote: Quote.init(
                usd: USDQuote.init(
                    percentChange24h: 0.518894,
                    price: 98102.89,
                    marketCap: 852164659250.2758,
                    volume24h: 7155680000,
                    fullyDilutedMarketCap: 952835089431.14
                )
            )
        )
    }
    
    static var bnbMock: Coin {
        Coin(
            id: 4,
            name: "Bitcoin",
            symbol: "BTC",
            circulatingSupply: 16950100.0,
            totalSupply: 16950100.0,
            maxSupply: 21000000,
            quote: Quote.init(
                usd: USDQuote.init(
                    percentChange24h: 0.518894,
                    price: 98102.89,
                    marketCap: 852164659250.2758,
                    volume24h: 7155680000,
                    fullyDilutedMarketCap: 952835089431.14
                )
            )
        )
    }
}

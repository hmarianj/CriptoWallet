//
//  CoinService.swift
//  CriptoWallet
//
//  Created by MH on 25/03/2025.
//

import CoreNetworking
import Foundation

protocol CoinServiceProtocol {
    func getCoins() async throws -> [Coin]
}

struct CoinService: CoinServiceProtocol {
    func getCoins() async throws -> [Coin] {
        let response = try await HTTPClient.shared.execute(
            Request(
                urlString: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=5000&convert=USD",
                method: .get([]),
                headers: [
                    "X-CMC_PRO_API_KEY": "c77cfcd6-3b60-479e-89fa-deea03bdbe89"
                ]
            ),
            responseType: CoinListResponse.self
        )
        return response.data
    }
}

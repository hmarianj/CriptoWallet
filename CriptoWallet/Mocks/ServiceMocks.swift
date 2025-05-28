//
//  ServiceMocks.swift
//  CriptoWallet
//
//  Created by MH on 25/03/2025.
//

import Foundation

struct ServiceMocks: CoinServiceProtocol {
    var shouldFail = false
    var mockCoins: [Coin] = [
        .bitcoinMock,
        .ethereumMock,
        .tetherMock,
        .bnbMock
    ]

    func getCoins() async throws -> [Coin] {
        if shouldFail {
            throw NSError(domain: "Mock Error", code: 1, userInfo: nil)
        }
        return mockCoins
    }
}

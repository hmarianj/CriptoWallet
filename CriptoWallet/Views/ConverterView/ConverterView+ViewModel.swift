//
//  ConverterView+ViewModel.swift
//  CriptoWallet
//
//  Created by MH on 27/05/2025.
//

import Foundation

extension ConverterView {
    final class ViewModel: ObservableObject {
        @Published var coinAmount: String = "1"
        @Published var usdAmount: String = ""
        private let coin: Coin

        init(coin: Coin) {
            self.coin = coin
            updateUSDFromCoin()
        }

        var coinSymbol: String {
            coin.symbol.uppercased()
        }

        var coinName: String {
            coin.name
        }

        private var coinPrice: Double {
            coin.quote?.usd.price ?? 0.0
        }

        func updateUSDFromCoin() {
            let coinValue = Double(coinAmount) ?? 0
            usdAmount = String(format: "%.2f", coinValue * coinPrice)
        }

        func updateCoinFromUSD() {
            let usdValue = Double(usdAmount) ?? 0
            coinAmount = String(format: "%.6f", usdValue / coinPrice)
        }
    }
}

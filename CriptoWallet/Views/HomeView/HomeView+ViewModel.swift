//
//  HomeView+ViewModel.swift
//  CriptoWallet
//
//  Created by MH on 17/03/2025.
//

import CoreNetworking
import Foundation
import SwiftUI

extension HomeView {
    final class ViewModel: ObservableObject {
        @Published var coins: [Coin] = []
        @Published var isLoading: Bool = false
        @Published var displayError: Bool = false

        private let coinService: CoinServiceProtocol

        init(coinService: CoinServiceProtocol = CoinService()) {
            self.coinService = coinService
        }
    }
}

extension HomeView.ViewModel {
    @MainActor
    func getCoin() async {
        isLoading = true
        displayError = false
        do {
            let response = try await coinService.getCoins()
            isLoading = false
            coins = response
        } catch {
            isLoading = false
            displayError = true
        }
    }
}

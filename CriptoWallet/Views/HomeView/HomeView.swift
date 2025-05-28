//
//  HomeView.swift
//  CriptoWallet
//
//  Created by MH on 17/03/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: ViewModel = ViewModel()
    @State var searchText: String = ""

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if viewModel.displayError {
                ErrorView {
                    Task {
                        await viewModel.getCoin()
                    }
                }
            } else if !viewModel.coins.isEmpty {
                contentView(viewModel.coins)
            } else {
                Text("Initial State")
            }
        }
        .task {
            await viewModel.getCoin()
        }
    }
}

private extension HomeView {
    var filteredCoins: [Coin] {
        if searchText.isEmpty {
            return viewModel.coins
        } else {
            return viewModel.coins.filter {
                $0.name.lowercased().contains(searchText.lowercased()) || $0.symbol.lowercased()
                    .contains(searchText.lowercased())
            }
        }
    }

    func contentView(_: [Coin]) -> some View {
        NavigationStack {
            ScrollView {
                SearchBar(searchText: $searchText)
                LazyVStack {
                    ForEach(filteredCoins, id: \.id) { coin in
                        NavigationLink(
                            destination: CoinDetailsView(
                                coin: coin
                            )
                        ) {
                            CoinCard(model: .init(coin: coin))
                        }
                    }
                }
                .navigationTitle("Cripto Wallet")
            }
            .scrollIndicators(.hidden)
            .background(Color.bgWhite)
        }
    }
}

#Preview {
    HomeView()
}

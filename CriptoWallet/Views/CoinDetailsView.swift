//
//  CoinDetailsView.swift
//  CriptoWallet
//
//  Created by MH on 22/05/2025.
//

import SwiftUI

struct CoinDetailsView: View {
    let coin: Coin
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                coinImageView
                coinNameView
                coinPrice
                marketValueView
                LazyVGrid(columns: columns, spacing: 16) {
                    volumeView
                    fdvView
                    market24View
                    totalSupplyView
                    maxSupplyView
                    circulatingSupplyView
                }
                .padding(.bottom)
                ConverterView(coin: coin)
            }
            .padding(.bottom)
        }
        .scrollIndicators(.hidden)
        .padding()
        .background(Color.bgWhite)
    }
}

private extension CoinDetailsView {
    var coinImageView: some View {
        AsyncImage(url: URL(string: coin.imageUrl)) { image in
            image.resizable()
                .frame(width: 60, height: 60)
                .clipShape(.circle)
        } placeholder: {
            ProgressView()
                .frame(width: 60, height: 60)
                .background(.grayLight)
                .clipShape(.circle)
        }
    }

    var coinNameView: some View {
        VStack {
            Text(coin.name)
                .font(.title)
            Text(coin.symbol)
                .font(.callout)
                .foregroundStyle(.grayMedium)
        }
    }

    var coinPrice: some View {
        VStack(spacing: 0) {
            Text(coin.quote?.usd.price?.formatted(.currency(code: "USD")) ?? "0")
                .font(.system(.title, weight: .semibold))
                .foregroundStyle(.grayDark)
            changePercentView
        }
        .padding(.vertical)
    }

    var changePercentView: some View {
        HStack(alignment: .center) {
            Image(systemName: "arrowtriangle.up.fill")
                .font(.footnote)
                .rotationEffect(.degrees(coin.quote?.usd.percentChange24h ?? 0 < 0 ? 180 : 0))
            Text("\(coin.quote?.usd.percentChange24h ?? 0, specifier: "%.2f")% (1d)")
        }
        .foregroundStyle(Double(coin.quote?.usd.percentChange24h ?? 0) < 0 ? .red : .green)
    }

    var marketValueView: some View {
        InfoDetailsBox(
            model: .init(
                title: "Market cap",
                value: (coin.quote?.usd.marketCap ?? 0.0).formattedWithAbbreviation(suffix: "USD")
            )
        )
    }

    var volumeView: some View {
        InfoDetailsBox(
            model: .init(
                title: "Volume (24h)",
                value: (coin.quote?.usd.volume24h ?? 0.0).formattedWithAbbreviation(suffix: "USD")
            )
        )
    }

    var fdvView: some View {
        InfoDetailsBox(
            model: .init(
                title: "FDV",
                value: (coin.quote?.usd.fullyDilutedMarketCap ?? 0.0).formattedWithAbbreviation(suffix: "USD")
            )
        )
    }

    var market24View: some View {
        InfoDetailsBox(
            model: .init(
                title: "Vol/Mkt Cap (24h)",
                value: formattedVolumeToMarketCapRatio(coin.quote?.usd.volumeToMarketCapRatio)
            )
        )
    }

    var totalSupplyView: some View {
        InfoDetailsBox(
            model: .init(
                title: "Total supply",
                value: (coin.totalSupply ?? 0.0).formattedWithAbbreviation(suffix: "BTC")
            )
        )
    }

    var maxSupplyView: some View {
        InfoDetailsBox(
            model: .init(
                title: "Max. supply",
                value: (coin.maxSupply ?? 0.0).formattedWithAbbreviation(suffix: "BTC")
            )
        )
    }

    var circulatingSupplyView: some View {
        InfoDetailsBox(
            model: .init(
                title: "Circulating supply",
                value: (coin.circulatingSupply ?? 0.0).formattedWithAbbreviation(suffix: "BTC")
            )
        )
    }

    func formattedVolumeToMarketCapRatio(_ ratio: Double?) -> String {
        guard let ratio else { return "N/A" }
        return String(format: "%.2f%%", ratio * 100)
    }
}

#Preview {
    CoinDetailsView(coin: .bitcoinMock)
}

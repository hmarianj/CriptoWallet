//
//  CoinCard.swift
//  CriptoWallet
//
//  Created by MH on 17/03/2025.
//

import SwiftUI

struct CoinCard: View {
    var model: CoinCard.Model

    var body: some View {
        HStack {
            coinImageView
            VStack(alignment: .leading) {
                initialsView
                nameView
            }
            Spacer()
            VStack(alignment: .trailing) {
                priceView
                changePercentView
            }
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.grayLight, lineWidth: 1)
        }
        .background(Color.whiteLight)
        .cornerRadius(12)
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
    }
}

extension CoinCard {
    struct Model {
        let imageUrl: String
        let symbol: String
        let name: String
        let price: Double
        let changePercent: Double

        init(coin: Coin) {
            imageUrl = coin.imageUrl
            symbol = coin.symbol
            name = coin.name
            price = coin.quote?.usd.price ?? 0
            changePercent = coin.quote?.usd.percentChange24h ?? 0
        }
    }
}

private extension CoinCard {
    var coinImageView: some View {
        AsyncImage(url: URL(string: model.imageUrl)) { image in
            image.resizable()
                .clipShape(.circle)
                .frame(width: 40, height: 40)
        } placeholder: {
            ProgressView()
                .frame(width: 40, height: 40)
                .background(.grayLight)
                .clipShape(.circle)
        }
    }

    var initialsView: some View {
        Text(model.symbol)
            .font(.system(.title3, weight: .semibold))
            .foregroundStyle(.blackDark)
    }

    var nameView: some View {
        Text(model.name)
            .font(.headline)
            .foregroundStyle(.gray)
    }

    var priceView: some View {
        Text(model.price.formatted(.currency(code: "USD")))
            .font(.system(.title3, weight: .semibold))
            .foregroundStyle(.blackDark)
    }

    var changePercentView: some View {
        HStack(alignment: .center) {
            Image(systemName: "arrow.up")
                .font(.footnote)
                .rotationEffect(.degrees(model.changePercent < 0 ? 180 : 0))
            Text("\(model.changePercent, specifier: "%.2f")%")
        }
        .foregroundStyle(Double(model.changePercent) < 0 ? .red : .green)
    }
}

#Preview {
    VStack {
        CoinCard(model: .init(coin: .bitcoinMock))
        CoinCard(model: .init(coin: .ethereumMock))
    }
}

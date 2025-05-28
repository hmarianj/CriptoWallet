//
//  ConverterView.swift
//  CriptoWallet
//
//  Created by MH on 27/05/2025.
//

import SwiftUI

struct ConverterView: View {
    @StateObject private var viewModel: ConverterView.ViewModel
    @FocusState private var focusedField: Field?

    init(coin: Coin) {
        _viewModel = StateObject(wrappedValue: ConverterView.ViewModel(coin: coin))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("\(viewModel.coinName) to USD Converter")
                .font(.system(.title3, weight: .semibold))
            VStack(spacing: 16) {
                currencyInputRow(
                    title: viewModel.coinSymbol,
                    text: $viewModel.coinAmount,
                    field: .coin
                ) {
                    if focusedField == .coin {
                        viewModel.updateUSDFromCoin()
                    }
                }
                currencyInputRow(
                    title: "USD",
                    text: $viewModel.usdAmount,
                    field: .usd
                ) {
                    if focusedField == .usd {
                        viewModel.updateCoinFromUSD()
                    }
                }
            }
        }
    }
}

private extension ConverterView {
    enum Field { case coin, usd }

    @ViewBuilder
    func currencyInputRow(
        title: String,
        text: Binding<String>,
        field: Field,
        onChange: @escaping () -> Void
    ) -> some View {
        HStack {
            Text(title)
                .foregroundStyle(.grayDark)
            TextField("", text: text)
                .fontWeight(.semibold)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.trailing)
                .focused($focusedField, equals: field)
                .onChange(of: text.wrappedValue) {
                    onChange()
                }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.whiteLight)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.grayLight, lineWidth: 1)
        )
        .cornerRadius(12)
    }
}

#Preview {
    ConverterView(coin: .bitcoinMock)
        .padding()
}

//
//  InfoDetailsBox.swift
//  CriptoWallet
//
//  Created by MH on 22/05/2025.
//

import SwiftUI

struct InfoDetailsBox: View {
    var model: InfoDetailsBox.Model

    var body: some View {
        VStack(spacing: 8) {
            Text(model.title)
                .foregroundStyle(.grayMedium)
            Text("\(model.value)")
                .font(.system(.title3, weight: .semibold))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.grayLight, lineWidth: 1)
        }
        .background(.whiteLight)
        .cornerRadius(12)
    }
}

extension InfoDetailsBox {
    struct Model {
        var title: String
        var value: String
    }
}

#Preview {
    InfoDetailsBox(
        model: InfoDetailsBox.Model(
            title: "Volume",
            value: "34.89"
        )
    )
}

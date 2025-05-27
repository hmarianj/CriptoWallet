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
                .foregroundStyle(.black.opacity(0.6))
            Text("\(model.value)")
                .font(.system(.title3, weight: .semibold))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray.opacity(0.4), lineWidth: 1)
        }
        .background(.white)
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
        model: InfoDetailsBox.Model.init(
            title: "Volume",
            value: "34.89"
        )
    )
}

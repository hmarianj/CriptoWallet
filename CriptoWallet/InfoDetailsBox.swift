//
//  InfoDetailsBox.swift
//  CriptoWallet
//
//  Created by MH on 22/05/2025.
//

import SwiftUI

struct InfoDetailsBox: View {
    // TODO: fix this
    var body: some View {
        VStack {
            Text("MarketCap")
            Text("34375783")
        }
        padding()
        .background(Color.white)
        .cornerRadius(12)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray.opacity(0.4), lineWidth: 1)
        }
    }
}

#Preview {
    InfoDetailsBox()
}

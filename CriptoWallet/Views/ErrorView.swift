//
//  ErrorView.swift
//  CriptoWallet
//
//  Created by MH on 20/03/2025.
//

import SwiftUI

struct ErrorView: View {
    var onRetry: () -> Void

    var body: some View {
        VStack {
            Text("Something went wrong")
            Button {
                onRetry()
            } label: {
                Text("Retry")
                    .padding()
            }
        }
    }
}

#Preview {
    ErrorView {
        print("Retry")
    }
}

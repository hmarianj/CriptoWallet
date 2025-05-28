//
//  SearchBar.swift
//  CriptoWallet
//
//  Created by MH on 17/03/2025.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.title3)
                .foregroundStyle(.grayMedium)
            TextField(
                "",
                text: $searchText,
                prompt: Text("Search coin")
            )
            .font(.body)
            .foregroundStyle(.black)
        }
        .padding(12)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.grayLight, lineWidth: 2)
//                .shadow(color: .grayLight, radius: 8, x: 0, y: 2)
        }
        .background(.whiteLight)
        .cornerRadius(12)
        .padding()
    }
}

#Preview {
    SearchBar(searchText: .constant(""))
}

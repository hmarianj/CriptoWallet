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
                .foregroundStyle(.gray)
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
                .stroke(.gray.opacity(0.4), lineWidth: 2)
                .shadow(color: .black.opacity(0.4), radius: 8, x: 0, y: 2)
        }
        .background(.white)
        .cornerRadius(12)
        .padding()
    }
}

#Preview {
    SearchBar(searchText: .constant(""))
}

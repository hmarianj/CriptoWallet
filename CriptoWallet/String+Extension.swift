//
//  String+Extension.swift
//  CriptoWallet
//
//  Created by MH on 20/03/2025.
//

import Foundation

extension String {
    func formattedToDecimalPlaces(_ places: Int = 2) -> String {
        if let number = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = places
            formatter.minimumFractionDigits = places
            return formatter.string(from: NSNumber(value: number)) ?? self
        } else {
            return self
        }
    }
}

//
//  Double+Extension.swift
//  CriptoWallet
//
//  Created by MH on 26/05/2025.
//

extension Double {
    func formattedWithAbbreviation(suffix: String? = nil) -> String {
        let num = abs(self)
        let sign = self < 0 ? "-" : ""
        
        let formatted: String
        switch num {
        case 1_000_000_000_000...:
            formatted = num.truncatingRemainder(dividingBy: 1) == 0
                ? String(format: "%.0fT", num / 1_000_000_000_000)
                : String(format: "%.2fT", num / 1_000_000_000_000)
        case 1_000_000_000...:
            formatted = num.truncatingRemainder(dividingBy: 1) == 0
                ? String(format: "%.0fB", num / 1_000_000_000)
                : String(format: "%.2fB", num / 1_000_000_000)
        case 1_000_000...:
            formatted = num.truncatingRemainder(dividingBy: 1) == 0
                ? String(format: "%.0fM", num / 1_000_000)
                : String(format: "%.1fM", num / 1_000_000)
        case 1_000...:
            formatted = num.truncatingRemainder(dividingBy: 1) == 0
                ? String(format: "%.0fK", num / 1_000)
                : String(format: "%.1fK", num / 1_000)
        default:
            formatted = String(format: "%.0f", num)
        }
        
        return suffix != nil ? "\(sign)\(formatted) \(suffix!)" : "\(sign)\(formatted)"
    }
}

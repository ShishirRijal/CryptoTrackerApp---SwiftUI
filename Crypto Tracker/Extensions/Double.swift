//
//  Double.swift
//  Crypto Tracker
//
//  Created by Shishir Rijal on 17/07/2024.
//

import Foundation

extension Double {
 
    /// Converts a Double into a Currency with 'fraction' decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    func asCurrencyWithDecimals(_ fraction: Int, separator: Bool = false) -> String {
        let value = NSNumber(value: self)
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = separator
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = fraction
        formatter.currencySymbol = "$"
//        formatter.currencyCode = "usd"
        
        return formatter.string(from: value) ?? "0.00"
      }
    
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
}

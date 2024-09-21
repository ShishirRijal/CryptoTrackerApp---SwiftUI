//
//  UIApplication.swift
//  Crypto Tracker
//
//  Created by Shishir Rijal on 22/09/2024.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}

//
//  HomeViewModel.swift
//  Crypto Tracker
//
//  Created by Shishir Rijal on 19/07/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoin: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0 ) {
            self.allCoins.append(MockCoinModel.coin)
            self.portfolioCoin.append(MockCoinModel.coin)
        }
    }
    
}

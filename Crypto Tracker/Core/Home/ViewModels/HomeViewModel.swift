//
//  HomeViewModel.swift
//  Crypto Tracker
//
//  Created by Shishir Rijal on 19/07/2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoin: [CoinModel] = []
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        print("view model init")
        addSubscribers()
    }
    
    func addSubscribers() {
        print("add subscribers")
        dataService.$allCoin
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
}

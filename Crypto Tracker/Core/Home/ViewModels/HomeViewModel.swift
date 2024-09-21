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
       
        $searchText
            .combineLatest(dataService.$allCoin)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink {[weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        let lowercaseText = text.lowercased()
        let filteredCoins = coins.filter { (coin) in
            return coin.name.lowercased().contains(lowercaseText) || coin.symbol.lowercased().contains(lowercaseText) || coin.id.lowercased().contains(lowercaseText)
        }
        return filteredCoins
    }
    
}

//
//  CoinDataService.swift
//  Crypto Tracker
//
//  Created by Shishir Rijal on 19/07/2024.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoin: [CoinModel] = []
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoin()
    }
    
    private func getCoin() {
        print("GET coins")
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&api_key=CG-SWHCGyjTS4BaJjpgyfC8rR7d")
        else {
            return
        }
        
        coinSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode>=200 && response.statusCode<300 else {
                    throw URLError(.badServerResponse)
                }
                print("output.data = \(output.data)")
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch(completion) {
                case .finished:
                    break
                case .failure(let error):
                    print("error: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] (returnedCoins) in
                self?.allCoin = returnedCoins
            }

    }
    
}

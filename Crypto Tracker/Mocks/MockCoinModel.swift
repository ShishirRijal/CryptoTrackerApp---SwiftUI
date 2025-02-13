//
//  MockCoinModel.swift
//  Crypto Tracker
//
//  Created by Shishir Rijal on 17/07/2024.
//

import Foundation

class MockCoinModel {
    static let coin = CoinModel(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: 58908, marketCap: 1100013258170, marketCapRank: 1, fullyDilutedValuation: 1235028318246, totalVolume: 69075964521, high24H: 59504, low24H: 57672, priceChange24H: 808.94, priceChangePercentage24H: 1.39234, marketCapChange24H: 13240944103, marketCapChangePercentage24H: 1.21837, circulatingSupply: 18704250, totalSupply: 21000000, maxSupply: 21000000, ath: 64805, athChangePercentage: -9.24909, athDate: "2021-04-14T11:54:46.763Z", atl: 67.81, atlChangePercentage: 86630.1867, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2021-05-09T04:06:09.766Z", sparklineIn7D: SparklineIn7D(price:[
          57812.96915967891,
          57504.33531773738,
        ]),
        priceChangePercentage24HInCurrency: 1.3923423473152687, currentHoldings: 1.5
    )
}


let stat1 = StatisticModel(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34)
let stat2 = StatisticModel(title: "Total Volume", value: "$1.23Tr")
let stat3 = StatisticModel(title: "Portfolio Value", value: "$50.4k", percentageChange: -12.34)

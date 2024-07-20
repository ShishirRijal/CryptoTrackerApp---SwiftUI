//
//  CoinRowView.swift
//  Crypto Tracker
//
//  Created by Shishir Rijal on 17/07/2024.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            
            leftColumn
            
            Spacer()
            
            // Holdings Column
            if(showHoldingsColumn) {
                centerColumn
            }
            
            rightColumn

        }
        .font(.subheadline)
        
    }
    
}


extension CoinRowView {
    
    private var leftColumn : some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondayText)
                .frame(minWidth: 30)
            
            CoinImageView(coin: coin)
                .frame(width:30, height: 30)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 10)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWithDecimals(2, separator: true))
            Text((coin.currentHoldings)?.asNumberString() ?? "")
        }
    }
    
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text("\(coin.currentPrice.asCurrencyWithDecimals(2, separator: true))")
                .bold()
                .foregroundColor(Color.theme.accent)
            
            Text("\(coin.priceChangePercentage24H?.asNumberString() ?? "")%")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.green : Color.theme.red
                )
        }.frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
    
}



#Preview(traits: .sizeThatFitsLayout ) {
        
        CoinRowView(coin: MockCoinModel.coin, showHoldingsColumn: true)
            .previewLayout(.sizeThatFits)
    
//        CoinRowView(coin: MockCoinModel.coin, showHoldingsColumn: true)
//            .previewLayout(.sizeThatFits)
//            .preferredColorScheme(.dark)
    
}

//
//  CoinImageView.swift
//  Crypto Tracker
//
//  Created by Shishir Rijal on 20/07/2024.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject var vm: CoinImageViewModel
    
    init(coin: CoinModel) {
        _vm =  StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            else if (vm.isLoading) {
                ProgressView()
            }
            else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondayText)
            }
        }
    }
}

#Preview {
    CoinImageView(coin: MockCoinModel.coin)
        .previewLayout(.sizeThatFits)
}

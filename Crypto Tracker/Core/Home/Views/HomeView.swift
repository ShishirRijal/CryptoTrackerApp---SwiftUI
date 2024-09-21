//
//  HomeView.swift
//  Crypto Tracker
//
//  Created by Shishir Rijal on 17/07/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = true
    @EnvironmentObject private var vm: HomeViewModel
    
    
    var body: some View {
     
        ZStack {
            // setting background color
            Color.theme.backgroundColor
                .ignoresSafeArea()
            VStack{
                
                homeHeader
                
                HomeStatsView(showPortfolio: $showPortfolio)
                
                SearchBarView(searchText: $vm.searchText)
                
                columnTitles

                allCoinsList
                    .transition(.move(edge: .leading))
                                
            }
            
        }
    }
}


extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(name: showPortfolio ? "plus": "info")
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(name: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180: 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                        
                    }
                }
        }.padding(.horizontal)
    }
    

    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: showPortfolio)
                    .listRowInsets(.init(top:10, leading:0, bottom:10, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if(showPortfolio) {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondayText)
        .padding(.horizontal)
    }
    
}


#Preview {
    NavigationView {
        HomeView()
    }.navigationBarHidden(true)
        .environmentObject(HomeViewModel())
}

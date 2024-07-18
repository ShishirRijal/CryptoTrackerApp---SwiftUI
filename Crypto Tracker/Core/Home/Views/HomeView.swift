//
//  HomeView.swift
//  Crypto Tracker
//
//  Created by Shishir Rijal on 17/07/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            // setting background color
            Color.theme.backgroundColor
                .ignoresSafeArea()
            VStack{
                homeHeader
                Spacer(minLength: 0)
                
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
}


#Preview {
    NavigationView {
        HomeView()
    }.navigationBarHidden(true)
}

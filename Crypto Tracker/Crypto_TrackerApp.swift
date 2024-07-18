//
//  Crypto_TrackerApp.swift
//  Crypto Tracker
//
//  Created by Shishir Rijal on 17/07/2024.
//

import SwiftUI

@main
struct Crypto_TrackerApp: App {
    
    @StateObject private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}

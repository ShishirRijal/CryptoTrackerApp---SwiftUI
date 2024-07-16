//
//  CircleButtonAnimationView.swift
//  Crypto Tracker
//
//  Created by Shishir Rijal on 17/07/2024.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding  var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1: 0)
            .opacity(animate ? 0 : 1)
            .animation(Animation.easeInOut(duration: 1.0), value: animate)
            .onAppear{
                animate.toggle()
            }
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(true))
}

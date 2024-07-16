//
//  CircleButtonView.swift
//  Crypto Tracker
//
//  Created by Shishir Rijal on 17/07/2024.
//

import SwiftUI

struct CircleButtonView: View {
    let  name: String
    var body: some View {
        Image(systemName: name)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width:50, height:50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.backgroundColor)
                    .shadow(
                        color: Color.theme.accent.opacity(0.25),
                        radius: 10, x: 0, y: 0)
            )
            .padding()
    }
}

#Preview {
    Group {
        CircleButtonView(name: "info")
            .previewLayout(.sizeThatFits)
        CircleButtonView(name: "heart.fill")
            .previewLayout(.sizeThatFits).colorScheme(.dark)
    }
    
        
}

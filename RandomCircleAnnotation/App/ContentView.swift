//
//  ContentView.swift
//  RandomCircleAnnotation
//
//  Created by Hidayat Abisena on 18/09/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var animation: Double = 0.0
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.purple)
                .frame(width: 128, height: 128, alignment: .center)
            
            Circle()
                .stroke(Color.purple, lineWidth: 6)
                .frame(width: 128, height: 128, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(systemName: "moon.circle")
                .font(.system(size: 128))
                .frame(width: 128, height: 128, alignment: .center)
                .clipShape(Circle())
        } //: ZSTACK
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(RandomCircleAnimationBackground())
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  AnimationsLab
//
//  Created by Daniel Umpierrez on 5/4/26.
//

import SwiftUI

struct ContentView: View {
    @State private var scaleDown = false
    @State private var fadeOut = false
    @State private var appear = false
    @State private var countDown = ["3", "2", "1", "GO!"]
    @State private var currentCount = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(countDown[currentCount])
                .font(.custom("Super Mario 256", size: 200))
                .scaleEffect(scaleDown ? 0.1 : 1)
                .opacity(appear ? 1 : 0)
                .opacity(fadeOut ? 0 : 1)
            
            Spacer()
            
            Button("Start") {
                startCountDown()
            }
            .font(.custom("Super Mario 256", size: 40))
        }
        .padding(.vertical, 40)
    }
    
    func startCountDown() {
        Task {
            for count in 0..<countDown.count {
                
                scaleDown = false
                fadeOut = false
                appear = false
                
                currentCount = count
                
                // Animate appearance + scale
                withAnimation(.easeIn(duration: 0.5)) {
                    appear = true
                    scaleDown = true
                }
                
                // Wait before fading out
                try? await Task.sleep(nanoseconds: 700_000_000)
                
                // Fade out
                withAnimation(.easeOut(duration: 0.2)) {
                    if currentCount < 3 {
                        fadeOut = true
                    }
                }
                
                // Wait before next number
                try? await Task.sleep(nanoseconds: 500_000_000)
            }
        }
    }
}
#Preview {
    ContentView()
}

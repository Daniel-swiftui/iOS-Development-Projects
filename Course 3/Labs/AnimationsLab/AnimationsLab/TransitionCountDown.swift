//
//  TransitionCountDown.swift
//  AnimationsLab
//
//  Created by Daniel Umpierrez on 5/5/26.
//

import SwiftUI

struct TransitionCountDown: View {
    @Namespace var personAnimation
    @State private var countDown = ["3", "2", "1", "GO!"]
    @State private var currentCount = 0
    @State private var showText = false
    @State private var image = ["person.3.fill", "person.2.fill", "person.fill", "person.3"]
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                if showText {
                    VStack{
                        Image(systemName: image[currentCount])
                            .resizable()
                            .frame(width: 50, height: 50)
                            .matchedGeometryEffect(id: "person", in: personAnimation)
                        Text(countDown[currentCount])
                            .font(.custom("Super Mario 256", size: 200))
                            .transition(.asymmetric(
                                insertion: .scale(scale: 1),
                                removal: .scale(scale: 0.1).combined(with: .opacity)
                            ))
                    }
                } else {
                    Image(systemName: image[currentCount])
                        .resizable()
                        .frame(width: 50, height: 50)
                        .transition(.scale)
                        .matchedGeometryEffect(id: "person", in: personAnimation)
                }
            }
            .animation(.easeInOut(duration: 0.5), value: showText)
            
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
            for index in 0..<countDown.count {
                currentCount = index
                
                // Show number (triggers transition in)
                withAnimation {
                    showText = true
                }
                
                // Hold on screen
                try? await Task.sleep(nanoseconds: 700_000_000)
                
                // Hide number (triggers transition out)
                withAnimation {
                    showText = false
                }
                
                // Wait before next number
                try? await Task.sleep(nanoseconds: 600_000_000)
            }
        }
    }
}


#Preview {
    TransitionCountDown()
}

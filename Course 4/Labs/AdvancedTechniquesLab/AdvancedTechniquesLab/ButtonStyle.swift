//
//  ButtonStyle.swift
//  AdvancedTechniquesLab
//
//  Created by Daniel Umpierrez on 5/15/26.
//
import SwiftUI
import Foundation

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(configuration.isPressed ? Color.gray.cornerRadius(20) : Color.niceColor.cornerRadius(20))
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .shadow(color: .gray, radius: configuration.isPressed ? 0 : 5)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

extension Color {
    static let niceColor = Color(hue: 0.4, saturation: 0.5, brightness: 0.9, opacity: 1)
}

#Preview {
    ContentView()
}

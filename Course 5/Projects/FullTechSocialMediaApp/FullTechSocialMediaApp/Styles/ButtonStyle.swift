//
//  ButtonStyle.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/10/26.
//
import SwiftUI
import Foundation

struct LoginButtonStyle: ButtonStyle {
    var isError: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            
            .background((isError ? Color.red : Color.buttonColor).cornerRadius(20))
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
struct EditButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(configuration.isPressed ? Color.gray.opacity(0.1) : Color.clear)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .foregroundColor(.black)
            .scaleEffect(configuration.isPressed ? 0.80 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
extension Color {
    static let buttonColor = Color(red: 0.00, green: 0.89, blue: 0.88, opacity: 1.00)
    static let buttonColorPressed = Color(red: 0.30, green: 0.89, blue: 0.88, opacity: 1.00)
}

struct AddImageButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 40, height: 80)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue)
            )
            .foregroundStyle(.white)
            
    }
}

struct PostButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue)
            )
            .foregroundStyle(.white)
            
    }
}

#Preview {
    let appState = AppState()
    
    ProfilePage()
        .environment(appState)
}


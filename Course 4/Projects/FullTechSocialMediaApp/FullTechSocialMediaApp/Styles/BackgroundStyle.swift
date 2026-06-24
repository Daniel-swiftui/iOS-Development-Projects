//
//  BackgroundStyle.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/10/26.
//

import SwiftUI
import Foundation


extension Color {
    static let backgroundColor1 = Color(red: 0.00, green: 0.66, blue: 0.95, opacity: 1.00)
    static let backgroundColor2 = Color(red: 0.09, green: 0.18, blue: 0.62, opacity: 1.00)
    static let backgroundColor3 = Color(red: 0.47, green: 0.49, blue: 1.00, opacity: 1.00)
}

extension LinearGradient {
    static let backgroundGradientLight = LinearGradient(colors: [Color.backgroundColor1, Color.backgroundColor2], startPoint: .top, endPoint: .bottom)
    static let backgroundGradientDark = linearGradient(colors: [Color.backgroundColor2, Color.backgroundColor3], startPoint: .top, endPoint: .bottom)
    
}

#Preview {
    @Previewable @State var isLoggedIn = false

    LoginScreen(isLoggedIn: $isLoggedIn)
}

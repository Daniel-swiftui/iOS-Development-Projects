//
//  InputFieldStyle.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/10/26.
//

import SwiftUI
import Foundation

struct InputFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray5))
            .cornerRadius(5)
            .shadow(radius: 5)
    }
}

extension View {
    var inputFieldStyle: some View {
        self.modifier(InputFieldStyle())
    }
}

#Preview {
    @Previewable @State var isLoggedIn = false

    LoginScreen(isLoggedIn: $isLoggedIn)
}

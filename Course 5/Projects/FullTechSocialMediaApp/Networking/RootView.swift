//
//  RootView.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/29/26.
//

import SwiftUI

struct RootView: View {

    @Environment(AppState.self) var appState

    var body: some View {
        ZStack {
            if appState.isLoggedIn {
                TabsView()
            } else {
                LoginScreen()
            }
        }
    }
}

#Preview {
    RootView()
}

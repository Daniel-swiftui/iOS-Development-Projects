//
//  FullTechSocialMediaAppApp.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/10/26.
//

import SwiftUI

@main
struct FullTechSocialMediaAppApp: App {
    @State private var appState = AppState()
       var body: some Scene {
           WindowGroup {
               RootView()
                   .environment(appState)
           }
       }
}

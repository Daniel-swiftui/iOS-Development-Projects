//
//  GameTrackerProject2App.swift
//  GameTrackerProject2
//
//  Created by Daniel Umpierrez on 5/8/26.
//

import SwiftUI
import SwiftData

@main
struct GameTrackerProject2App: App {
    init() {
            // navigation font customization
            let appearance = UINavigationBarAppearance()
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont(name: "Burbank Big Condensed Black", size: 50)!,
                .foregroundColor: UIColor.white
            ]
            
            appearance.largeTitleTextAttributes = attributes
            appearance.titleTextAttributes = attributes
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }

    var body: some Scene {
        WindowGroup {
            GamesListView()
        }
        .modelContainer(for: [Game.self, Player.self])
    }
}

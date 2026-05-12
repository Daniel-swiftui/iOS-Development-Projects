//
//  DragonDexApp.swift
//  DragonDex
//
//  Created by Logan Steven Bartell on 12/4/25.
//

import SwiftUI

@main
struct DragonDexApp: App {
    @State private var router = DragonsRouter()
    @State private var settings = BackgroundSettings()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navigationPath) {
                router.view(for: .dragonList)
                    .navigationDestination(for: DragonsRouter.Route.self) {
                        router.view(for: $0)
                    }
            }
            .environment(router)
            .environment(settings)
        }
    }
}

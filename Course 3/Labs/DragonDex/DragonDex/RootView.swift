//
//  ContentView.swift
//  DragonDex
//
//  Created by Logan Steven Bartell on 12/4/25.
//

import SwiftUI

struct RootView: View {
    @State var backgroundSettings = BackgroundSettings()
    @State private var router = DragonsRouter()
    var body: some View {
            TabView {
                
                NavigationStack(path: $router.navigationPath) {
                    DragonListView()
                        .toolbar {
                            ToolbarItem(id: "settings", placement: .topBarTrailing) {
                                settingsButton {
                                    // TODO: User tapped settings button, navigate to Settings view
                                    router.navigateTo(.settingsSheet)
                                }
                            }
                        }
                }

                // TODO: Black Diamond, impelement this feature and add a navigation router for it.
                NavigationStack {
                    RiderListView()
                        .toolbar {
                            ToolbarItem(id: "settings", placement: .topBarTrailing) {
                                settingsButton {
                                    // TODO: User tapped settings button, navigate to Settings view
                                    router.navigateTo(.settingsSheet)
                                }
                            }
                        }
                }
            }
            .environment(backgroundSettings)
            .environment(router)
        }
    // ViewBuilders
    
    private func settingsButton(_ didTap: @escaping () -> Void) -> some View {
        Button {
            didTap()
        } label: {
            Image(systemName: "gear")
        }    }
}


#Preview {
    RootView()
}

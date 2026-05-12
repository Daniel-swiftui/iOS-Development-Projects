//
//  DragonsRouter.swift
//  DragonDex
//
//  Created by Logan Steven Bartell on 12/4/25.
//
import Foundation
import SwiftUI

// TODO: Create a Navigation Router for navigating Dragon views

@Observable
class DragonsRouter {
    var navigationPath = NavigationPath()

    enum Route: Hashable {
        case dragonList
        case dragonDetail(Dragon)
        case powers([Power])
        case settingsSheet
    }

    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {

        case .dragonList:
            DragonListView()

        case .dragonDetail(let dragon):
            DragonDetailView(dragon: dragon)

        case .powers(let powers):
            PowersView(powers: powers)

        case .settingsSheet:
            SettingsSheetView()
        }
    }

    func navigateTo(_ route: Route) {
        navigationPath.append(route)
    }
}

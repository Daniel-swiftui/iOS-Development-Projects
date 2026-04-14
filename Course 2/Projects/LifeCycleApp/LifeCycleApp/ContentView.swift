//
//  ContentView.swift
//  LifeCycleApp
//
//  Created by Daniel Umpierrez on 3/11/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    @State private var events = "Events"
    var body: some View {
        NavigationStack {
            VStack{
                NavigationLink {
                    SecondView()
                } label: {
                    Text(events)
                }
                .onChange(of: scenePhase) { _, newPhase in
                    if newPhase == .inactive {
                        events.append("\n Inactive")
                    } else if newPhase == .active {
                        events.append("\n Active")
                    } else if newPhase == .background {
                        events.append("\n Background")
                    }
                }
                .onDisappear{
                    events.append("\n Disappeared")
                }
               
            }
        }
    }
}

struct SecondView: View {
    @State private var secondView = ""
    var body: some View {
        Text(secondView)
            .onAppear{
                secondView = "This just appeared"
            }
    }
}

#Preview {
    ContentView()
}

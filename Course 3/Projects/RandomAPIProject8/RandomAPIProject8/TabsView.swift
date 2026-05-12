//
//  TabView.swift
//  RandomAPIProject8
//
//  Created by Daniel Umpierrez on 4/20/26.
//


import SwiftUI

struct TabsView: View {
    var body: some View {
        TabView {
            DogView()
                .tabItem {
                    Image(systemName: "dog")
                    Text("Dog")
                }
            RepresentativeView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Rep")
                }
        }
        
    }
}

#Preview {
    TabsView()
}

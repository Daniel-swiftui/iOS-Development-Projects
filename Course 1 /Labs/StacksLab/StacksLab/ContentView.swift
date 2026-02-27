//
//  ContentView.swift
//  StacksLab
//
//  Created by Daniel Umpierrez on 2/19/26.
//

import SwiftUI

struct ContentView: View {
    
    let friends = ["Andrea", "Laura", "Phil","David","Ema","Amy"]
    
    var body: some View {
        ZStack(alignment: .center) {
            Color(.white)
                .ignoresSafeArea()
            ZStack(alignment: .bottomTrailing){
                VStack(alignment: .center, spacing: 40) {
                    Image(systemName: "chevron.left.circle")
                        .font(.system(size: 30))
                        .bold()
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity ,alignment: .leading)
                        .padding(15)
                    //Profile Overview
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 75))
                            .foregroundStyle(.blue)
                        VStack (alignment: .leading){
                            Text("Daniel Umpierrez")
                                .font(.title)
                                .bold()
                            Text("daniel@email.com")
                        }
                    }
                    //Stats
                    HStack(spacing: 20) {
                        HStack(spacing: 5) {
                            Image(systemName: "heart.fill")
                            Text("Likes 1.5M")
                                .font(.default)
                                .bold()
                        }
                        HStack(spacing: 5) {
                            Image(systemName: "eye.fill")
                            Text("Views 50k")
                                .font(.default)
                                .bold()
                        }
                        HStack(spacing: 5) {
                            Image(systemName: "person.3.fill")
                            Text("Followers 3.1M")
                                .font(.default)
                                .bold()
                        }
                    }
                    .padding()
                    //Friend List
                    VStack {
                        Text("Friends")
                            .font(.title2)
                            .bold()
                        List {
                            Section {
                                ForEach(friends, id:\.self) { friend in
                                    HStack{
                                        Text(friend)
                                            .font(.title3)
                                            .bold()
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .bold()
                                    }
                                }
                            }
                            
                        }
                        
                    }
                    Spacer()
                    //Tab bar
                    VStack(alignment: .center) {
                        HStack(spacing: 50){
                            VStack {
                                Image(systemName: "house")
                                    .font(.system(size: 30))
                                Text("Home")
                                    .font(.caption)
                                    .bold()
                            }
                            VStack {
                                Image(systemName: "person.2")
                                    .font(.system(size: 30))
                                Text("Friends")
                                    .font(.caption)
                                    .bold()
                            }
                            VStack {
                                Image(systemName: "ellipsis.bubble")
                                    .font(.system(size: 30))
                                Text("Inbox")
                                    .font(.caption)
                                    .bold()
                            }
                            VStack {
                                Image(systemName: "person.circle.fill")
                                    .font(.system(size: 35))
                                Text("Profile")
                                    .font(.caption)
                                    .bold()
                            }
                            .foregroundStyle(.blue)
                        }
                    }
                }
                Image(systemName: "magnifyingglass.circle.fill")
                    .opacity(0.7)
                    .font(.system(size: 60))
                    .foregroundStyle(.blue)
                    .offset(y:-85)
                    .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}

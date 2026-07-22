//
//  Test.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/11/26.
//

import SwiftUI
import Foundation

struct SelectionToggle: View {
    @Environment(AppState.self) var appState
    @State private var userSelection: Selection = .post
    @State private var selectedPost: Post? = nil
    @Namespace private var animation
    var body: some View {
        VStack {
            HStack {
                ForEach(Selection.allCases, id: \.rawValue) {
                    selection in
                    Text(selection.rawValue)
                        .foregroundStyle(userSelection == selection ? .white : .gray)
                        .bold()
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background {
                            ZStack {
                                if userSelection == selection {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.blue)
                                        .matchedGeometryEffect(id: "ActiveTab", in: animation)
                                }
                            }
                            .animation(.bouncy, value: userSelection)
                        }
                        .contentShape(.rect)
                        .onTapGesture {
                            userSelection = selection
                        }
                }
            }
            .padding(3)
            .background(.primary.opacity(0.06), in: RoundedRectangle(cornerRadius: 15))
            .padding()
        }
        
        if userSelection == .post {
            ForEach(appState.posts) { post in
                PostView(post: post)
            }
        }
        if userSelection == .media {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)) {
                ForEach(appState.posts) { post in
                    if let imageName = post.image {
                        Image(systemName: imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.white)
                                    .shadow(radius: 5)
                            )
                            .onTapGesture {
                                selectedPost = post
                            }
                    }
                }
            }
            .padding()
        }
    }
}



enum Selection: String, CaseIterable {
    case post = "Post"
    case media = "Media"
}

//
//  AppState.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/29/26.
//

import Foundation
import Observation
import SwiftUI

@Observable
final class AppState {

    var isLoggedIn: Bool = false
    var loginErrorMessage: String?
    var loginShakeTrigger = 0
    var authSecret: UUID?
    var currentUser: User = .currentUser

    var posts: [Post] = []
    var isloadingFeed: Bool = false
    var errorMessage: String?
    
    func loadFeed() async {
        isloadingFeed = true
        errorMessage = nil
        
        do {
            let dtos = try await NetworkController.shared.fetchPosts()
            
            self.posts = dtos.map { dto in
                let author: User

                if dto.authorUserId == currentUser.id {
                    author = currentUser
                } else {
                    author = User(
                        id: dto.authorUserId,
                        firstName: "",
                        lastName: "",
                        userName: dto.authorUserName,
                        bio: "",
                        profileImage: "person.fill",
                        backgroundCoverImage: .gray
                    )
                }

                return Post(dto: dto, author: author)
            }
            
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isloadingFeed = false
        
    }

    func addPost(title: String, content: String, image: String?) async {
        do {

            let dto = try await NetworkController.shared.createPost(
                title: title,
                content: content
            )

            let post = Post(
                dto: dto,
                author: currentUser
            )

            posts.insert(post, at: 0)

        } catch {

            print(error)
        }
    }

    func deletePost(_ post: Post) {
        posts.removeAll { $0.id == post.id }
    }

    func toggleLike(_ post: Post) {
        guard let index = posts.firstIndex(of: post) else { return }
        posts[index].toggleLike()
    }
    
    func updatePost(_ post: Post, title: String, content: String, image: String?) {
        guard let index = posts.firstIndex(of: post) else {return}
        
        posts[index].title = title
        posts[index].content = content
        posts[index].image = image
    }

    func addComment(to post: Post, text: String) {
        guard let index = posts.firstIndex(of: post) else { return }

        let comment = Comment(
            authorName: currentUser.fullName,
            text: text
        )

        posts[index].comments.append(comment)
    }
    
    func updateProfile(
        userName: String,
        bio: String?,
        techInterests: String?
    ) async {

        do {
            let updatedProfile = try await NetworkController.shared.updateProfile(
                userName: userName,
                bio: bio,
                techInterests: techInterests
            )

            currentUser.userName = updatedProfile.userName
            currentUser.bio = updatedProfile.bio ?? ""

        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func login(email: String, password: String) async {
        
        do {
            
            loginErrorMessage = nil

            let normalEmail = email
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .lowercased()

            let response = try await NetworkController.shared.signIn(
                email: normalEmail,
                password: password
            )

            authSecret = response.secret
            NetworkController.shared.secret = response.secret
            
            currentUser = User(
                id: response.userUUID,
                firstName: response.firstName,
                lastName: response.lastName,
                userName: response.userName,
                bio: "",
                profileImage: "person.fill",
                backgroundCoverImage: .blue
            )
            
            isLoggedIn = true
            
            await loadFeed()

        } catch {
            loginErrorMessage = "Incorrect email or password"
            
            loginShakeTrigger += 1
            print(error)
        }
    }
    
    func logout() {
        isLoggedIn = false
        authSecret = nil
        NetworkController.shared.secret = nil
        posts.removeAll()
    }
}

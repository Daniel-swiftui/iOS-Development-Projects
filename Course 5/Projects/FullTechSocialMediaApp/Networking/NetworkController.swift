//
//  NetworkController.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/25/26.
//

import Foundation

final class NetworkController {
    
    static let shared = NetworkController()
    
    private let baseURL = URL(string: "https://social-media-app.ryanplitt.com/")!
    
    var secret: UUID?
    
    private init() {}
    
    func request<T: Decodable>(endpoint: String) async throws -> T {
        
        let url = baseURL.appendingPathComponent(endpoint)
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        if let secret {
            request.setValue(
                "Bearer \(secret.uuidString)",
                forHTTPHeaderField: "Authorization"
            )
        }
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let http = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        if !(200...299).contains(http.statusCode) {
            print("Status Code:", http.statusCode)
            
            if let body = String(data: data, encoding: .utf8) {
                print("Response Body:", body)
            }
            
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return try decoder.decode(T.self, from: data)
    }
}

extension NetworkController {
    
    func fetchPosts() async throws -> [PostResponseDTO] {
        try await request(endpoint: "posts")
    }
    
    func fetchUserProfile(userId: UUID) async throws -> UserProfileResponseDTO {
        try await request(endpoint: "user/\(userId)")
    }
}

extension NetworkController {
    func post<Request: Encodable, Response: Decodable>(
        endpoint: String,
        body: Request
    ) async throws -> Response {
        
        let url = baseURL.appendingPathComponent(endpoint)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        if let secret {
            request.setValue(
                "Bearer \(secret.uuidString)",
                forHTTPHeaderField: "Authorization"
            )
        }
        request.setValue("application/json",
                         forHTTPHeaderField: "Content-Type")
        
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let http = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        if !(200...299).contains(http.statusCode) {
            print("Status Code:", http.statusCode)
            
            if let body = String(data: data, encoding: .utf8) {
                print("Response Body:", body)
            }
            
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return try decoder.decode(Response.self, from: data)
    }
}

extension NetworkController {
    func signIn(
        email: String,
        password: String
    ) async throws -> SignInResponseDTO {
        
        let request = SignInRequestDTO(
            email: email,
            password: password
        )
        
        return try await post(
            endpoint: "auth/login",
            body: request
        )
    }
}

extension NetworkController {
    func createPost(
        title: String,
        content: String
    ) async throws -> PostResponseDTO {
        
        let request = CreatePostRequestDTO(
            post: .init(
                title: title,
                body: content
            )
        )
        
        return try await post(
            endpoint: "post",
            body: request
        )
    }
}

extension NetworkController {
    func updateProfile(
        userName: String,
        bio: String?,
        techInterests: String?
    ) async throws -> UserProfileResponseDTO {
        
        let request = UpdateProfileRequestDTO(
            profile: .init(
                userName: userName,
                bio: bio,
                techInterests: techInterests
            )
        )
        
        return try await post(
            endpoint: "user/update-profile",
            body: request
        )
    }
}

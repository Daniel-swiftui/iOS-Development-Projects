//
//  DogAPIController.swift
//  RandomAPIProject8
//
//  Created by Daniel Umpierrez on 4/21/26.
//

import Foundation

protocol DogAPIControllerProtocol {
   func fetchImage() async throws -> Dog
}

struct DogAPIController: DogAPIControllerProtocol {
    
    func fetchImage() async throws -> Dog {
        let endpoint = "https://dog.ceo/api/breeds/image/random"
        
        guard let url = URL(string: endpoint) else {
            throw FetchError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(Dog.self, from: data)
        
        return Dog(message: result.message, status: result.status)
    }
    
}
enum FetchError: Error, LocalizedError {
    case invalidURL
    case badResponse(statusCode: Int)
    case noData

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "The URL is invalid."
        case .badResponse(let code): return "Bad response with status code: \(code)"
        case .noData: return "No data received from the server."
        }
    }
}


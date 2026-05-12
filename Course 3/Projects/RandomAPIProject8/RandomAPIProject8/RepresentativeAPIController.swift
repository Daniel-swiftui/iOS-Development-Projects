//
//  RepresentativeAPIController.swift
//  RandomAPIProject8
//
//  Created by Daniel Umpierrez on 4/23/26.
//

import Foundation

protocol RepresentativeAPIControllerProtocol {
    func fetchRepresentatives(zip: String) async throws -> [Representative]
}

struct RepresentativeAPIController: RepresentativeAPIControllerProtocol {
    
    func fetchRepresentatives(zip: String) async throws -> [Representative] {
        let endpoint = "https://whoismyrepresentative.com/getall_mems.php?zip=\(zip)&output=json"
        
        guard let url = URL(string: endpoint) else {
            throw FetchError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        let responseObject = try decoder.decode(RepresentativeResponse.self, from: data)
        
        return responseObject.results
    }
}
struct RepresentativeResponse: Codable {
    let results: [Representative]
}

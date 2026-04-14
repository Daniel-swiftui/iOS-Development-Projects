import UIKit
import Foundation

struct StoreItem: Codable {
    let trackName: String
    let artistName: String
    let kind: String?
    let description: String
    let artworkURL: URL?

    enum CodingKeys: String, CodingKey {
        case trackName
        case artistName
        case kind
        case description
        case artworkURL = "artworkUrl100"
    }

    enum AdditionalKeys: String, CodingKey {
        case longDescription
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.trackName = try values.decode(String.self, forKey: .trackName)
        self.artistName = try values.decode(String.self, forKey: .artistName)
        self.kind = try? values.decode(String.self, forKey: .kind)
        self.artworkURL = try? values.decode(URL.self, forKey: .artworkURL)

        if let desc = try? values.decode(String.self, forKey: .description) {
            self.description = desc
        } else {
            let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
            self.description = (try? additionalValues.decode(String.self, forKey: .longDescription)) ?? ""
        }
    }
}

struct SearchResponse: Codable {
    let results: [StoreItem]
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

func fetchItems(query: [String: String]) async throws -> [StoreItem] {
    let baseURL = "https://itunes.apple.com/search"
    guard var components = URLComponents(string: baseURL) else {
        throw FetchError.invalidURL
    }

    components.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
    guard let url = components.url else { throw FetchError.invalidURL }

    let (data, response) = try await URLSession.shared.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse else { throw FetchError.noData }
    guard httpResponse.statusCode == 200 else { throw FetchError.badResponse(statusCode: httpResponse.statusCode) }

    let decoder = JSONDecoder()
    let searchResponse = try decoder.decode(SearchResponse.self, from: data)
    return searchResponse.results
}


let query: [String: String] = [
    "term": "bad+bunny",
    "media": "music",
    "limit": "1"
]

Task {
    do {
        let storeItems = try await fetchItems(query: query) // make sure function name matches
        storeItems.forEach { item in
            print("""
            Name: \(item.trackName)
            Artist: \(item.artistName)
            Kind: \(item.kind ?? "N/A")
            Description: \(item.description)
            Artwork URL: \(item.artworkURL?.absoluteString ?? "N/A")
            """)
        }
    } catch {
        print("Error fetching items: \(error.localizedDescription)")
    }
}

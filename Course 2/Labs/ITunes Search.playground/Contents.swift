import UIKit

//var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
//
//urlComponents.queryItems = [
//    "term" : "bad+bunny",
//    "media" : "music",
//    "limit" : "1"
//].map { URLQueryItem (name: $0.key, value: $0.value)}
//
//Task {
//    let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
//    if let httpResponse = response as? HTTPURLResponse,
//       httpResponse.statusCode == 200,
//       let string = String(data: data, encoding: .utf8) {
//        print(string)
//    }
//}
struct Results: Codable {
    let results: [Song]
}
struct Song: Codable {
    let name: String
    let artist: String


    enum CodingKeys: String, CodingKey {
        case name = "collectionName"
        case artist = "artistName"
    }
}

let url = URL(string: "https://itunes.apple.com/search?term=badbunny&media=music&limit=1")
func fetchData() async {
    do {
        let (data, reponse) = try await URLSession.shared.data(from: url!)
        if let httpsResponse = reponse as? HTTPURLResponse,
           httpsResponse.statusCode == 200,
           let results = try? JSONDecoder().decode(Results.self, from: data) {
            print(results.results.first?.name)
        }
    } catch {
        print("There was an error \(error)")
    }
}
Task {
    await fetchData()
}

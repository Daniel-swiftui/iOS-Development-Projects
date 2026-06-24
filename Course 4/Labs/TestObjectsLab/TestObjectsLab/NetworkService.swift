//
//  NetworkService.swift
//  TestObjectsLab
//
//  Created by Daniel Umpierrez on 6/8/26.
//

import Foundation

protocol SongNetworkService {
    func fetchData(completion: (Song?) -> Void)
}

class DataFetcher: SongNetworkService {
    
    let networkserivce: SongNetworkService
    
    init(networkserivce: SongNetworkService) {
        self.networkserivce = networkserivce
    }
    
    func fetchData(completion: (Song?) -> Void)  {
        networkserivce.fetchData { data in
            completion(data)
        }
    }
}

class StubSongNetworkService: SongNetworkService {
    var data: Song
    
    init(data: Song) {
        self.data = data
    }
    
    func fetchData(completion: (Song?) -> Void) {
        completion(data)
    }
}

class FakeSongNetworkService: SongNetworkService {
    func fetchData(completion: (Song?) -> Void) {
        completion(nil)
    }
}

class MockSongNetworkService: SongNetworkService {
    var dataFetched = false
    func fetchData(completion: (Song?) -> Void) {
        dataFetched = true
    }
}

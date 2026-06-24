//
//  TestObjectsLabTests.swift
//  TestObjectsLabTests
//
//  Created by Daniel Umpierrez on 6/8/26.
//

import Testing
import Foundation

@testable import TestObjectsLab

@MainActor

struct TestObjectsLabTests {

    @Test("Stub Network") func testFetchData() async throws {
        let data = Song(name: "Pay Phone", artist: "Maroon 5")
        
        let stubSongNetworkService = StubSongNetworkService(data: data)
        let dataFetcher = DataFetcher(networkserivce: stubSongNetworkService)
        var completionData: Song?
        
        dataFetcher.fetchData { data in completionData = data }
        
        #expect(completionData == data)
        
    }
    
    @Test("Fake Network") func testSongDataFailedFetech() {
        let fakeSongNetworkService = FakeSongNetworkService()
        let dataFetcher = DataFetcher(networkserivce: fakeSongNetworkService)
        var completionData: Song?
        
        dataFetcher.fetchData { data in completionData = data}
        
        #expect(completionData == nil)
    }
    
    @Test("Mock Network") func textSongDataFetcherIsCalled() {
        let mockSongNetworkService = MockSongNetworkService()
        let dataFetcher = DataFetcher(networkserivce: mockSongNetworkService)
        
        dataFetcher.fetchData { _ in }
        
        #expect(mockSongNetworkService.dataFetched)
    }

}

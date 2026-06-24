//
//  TestLabTests.swift
//  TestLabTests
//
//  Created by Daniel Umpierrez on 6/5/26.
//

import Testing
@testable import TestLab

struct TestLabTests {

    @Test func addingSong() {
        let song = Song(title: "DtMF", artist: "Bad Bunny")
        #expect(song.addingSong == song.count + 1)
    }
    
    @Test func songName() {
        let song = Song(title: "Payphone", artist: "Maroon 5")
        #expect(song.songName == "Payphone Maroon 5")
    }

    @Test func removeSong() {
        let song = Song(title: "Bad Guy", artist: "Billie Eilish")
        #expect(song.removeSong == song.count - 1)
    }
    
    @Test func pauseSong() {
        let song = Song(title: "Bille Jean", artist: "Michael Jackson")
        #expect(song.pauseSong == (song.isPlaying == false))
    }
}

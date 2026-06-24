//
//  MusicController.swift
//  TestLab
//
//  Created by Daniel Umpierrez on 6/5/26.
//

import Foundation

class Song {
    let title: String
    let artist: String
    let count: Int = 0
    var isPlaying: Bool = true
    
    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
    
    var addingSong: Int {
        return count + 1
    }
    
    var songName: String {
        return ("\(title) \(artist)")
    }
    
    var removeSong: Int {
        return count - 1
    }
    
    var pauseSong: Bool {
        return isPlaying == false
    }
}

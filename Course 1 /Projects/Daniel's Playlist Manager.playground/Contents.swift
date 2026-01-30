import UIKit

struct Song: CustomStringConvertible {
    var name: String
    var author: String
    var playTime: Int
    
    var description: String {
        return "\(name) by \(author)"
    }
    
}

class Playlist {
    var name: String
    var author: String
    var songs: [Song] = []
    var currentlyPlaying: Int = 0
    var playTime: Int = 0
    
    init(name: String, author: String, songs: [Song], currentlyPlaying: Int, playTime: Int) {
        self.name = name
        self.author = author
        self.songs = songs
        self.currentlyPlaying = currentlyPlaying
        self.playTime = playTime
    }
    
    
    
    
    func add(_ song: Song) {
        //I want to use .append to add songs since songs is an array
        songs.append(song)
        print("\(song) has been added to your playlist.")
    }
    func remove(at index: Int = 0 ) {
        //Since songs is an array I can use .remove to remove a element of that array from a specific indices.
        songs.remove(at: index)
    }
    func clear() {
        //Same thing here .removeAll is already built in to the array struct and can be used to removed all elements from the array
        songs.removeAll()
        print("Playlist has been cleared.")
    }
    var count: Int {
        let songCount = songs.count
        print("You have \(songCount) songs in your playlist.")
        return songCount
    }
    func allSongs() -> [Song] {
        print(songs)
        return songs
    }
    func totalDuration() -> Int {
        // I want to add the playTime of all songs
        let totalPlayTime = songs.map { $0.playTime }.reduce(0, +)
        print("Your playlist is \(totalPlayTime) minutes long.")
        return totalPlayTime
    }
    func currentSong() -> Song? {
        guard songs.indices.contains(currentlyPlaying) else {
            return nil
        }
        return songs[currentlyPlaying]
    }
    func play(at index: Int) -> Song? {
        guard songs.indices.contains(index) else {
            print("Invalid song index.")
            return nil
        }
        currentlyPlaying = index
        let song = songs[index]
        print("Now playing \(song)")
        return song
    }
    func playNext() -> Song? {
        //I want to take the current song index and add one to change to the next song
        let nextIndex = currentlyPlaying + 1

            guard songs.indices.contains(nextIndex) else {
                print("No next song.")
                return nil
            }

            currentlyPlaying = nextIndex
            let song = songs[currentlyPlaying]
            print("Now playing \(song)")
            return song
    }
    func playPrevious() -> Song? {
        //I want to take the current song index and minus one to change to the next song
        let previousIndex = currentlyPlaying - 1

            guard songs.indices.contains(previousIndex) else {
                print("No previous song.")
                return nil
            }

            currentlyPlaying = previousIndex
            let song = songs[currentlyPlaying]
            print("Now playing \(song)")
            return song
    }
    func shuffle() {
        //I want to use the .shuffle() built into arrays to shuffle the song and then print the current song.
        songs.shuffle()
        currentlyPlaying = 0
        let song = songs[currentlyPlaying]
        print("Now playing \(song)")
    }
    
}

let song1 = Song(name: "song1", author: "author1", playTime: 3)
let song2 = Song(name: "song2", author: "author2", playTime: 2)
let song3 = Song(name: "song3", author: "author3", playTime: 4)
var playlist1 = Playlist(name: "", author: "", songs: [], currentlyPlaying: 0, playTime: 0)

playlist1.add(song1)
playlist1.add(song2)
playlist1.add(song3)
playlist1.allSongs()
playlist1.remove(at: 0)
playlist1.allSongs()

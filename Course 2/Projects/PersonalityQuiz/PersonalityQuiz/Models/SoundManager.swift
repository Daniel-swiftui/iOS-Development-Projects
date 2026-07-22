//
//  SoundManager.swift
//  PersonalityQuiz
//
//  Created by Daniel Umpierrez on 6/24/26.
//

import Foundation
import AVFoundation

class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    enum SoundOption: String {
        case theOffice2
        case buttonClick
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 0.02
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
    
    func stopSound(sound: SoundOption) {
        player?.stop()
        player = nil
    }
}

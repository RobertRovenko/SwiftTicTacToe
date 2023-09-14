//
//  SoundManager.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-14.
//


import AVFoundation

class SoundManager {
    static let shared = SoundManager() 
    
    var audioPlayer: AVAudioPlayer?
    
    private init() {}
    
    func playSound(named fileName: String) {
        if let path = Bundle.main.path(forResource: fileName, ofType: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
}

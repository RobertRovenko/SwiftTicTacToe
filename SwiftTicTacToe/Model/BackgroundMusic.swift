//
//  BackgroundMusic.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-14.
//

import AVFoundation

class BackgroundAudioManager {
    static let shared = BackgroundAudioManager()

    private var audioPlayer: AVAudioPlayer?

    private init() { }

    func startBackgroundAudio() {
        guard let soundURL = Bundle.main.url(forResource: "backgroundmusic", withExtension: "mp3") else {
            print("Background sound file not found.")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.numberOfLoops = -1 // Loop indefinitely
            audioPlayer?.play()
        } catch {
            print("Error playing background sound: \(error.localizedDescription)")
        }
    }

    func stopBackgroundAudio() {
        audioPlayer?.stop()
    }
}

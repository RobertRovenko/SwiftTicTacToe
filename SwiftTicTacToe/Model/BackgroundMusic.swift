//
//  BackgroundMusic.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-14.
//

import AVFoundation
import UIKit

class BackgroundMusic {
    static let shared = BackgroundMusic()

    private var audioPlayer: AVAudioPlayer?
    private var isPlaying = false
    
    private init() {
        configureAudioPlayer()
    }
    
       func start() {
           NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
           BackgroundMusic.shared.togglePlayback()
       }

    @objc func appWillEnterForeground() {
           BackgroundMusic.shared.startBackgroundAudio()
       }

       func stopBackgroundMusicAndNavigate() {
           SoundManager.shared.playSound(named: "menusound")
           BackgroundMusic.shared.stopBackgroundAudio()
       }

   

    private func configureAudioPlayer() {
        guard let soundURL = Bundle.main.url(forResource: "backgroundmusic", withExtension: "mp3") else {
            print("Background sound file not found.")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.prepareToPlay()
        } catch {
            print("Error initializing background sound: \(error.localizedDescription)")
        }
    }

    func togglePlayback() {
        if isPlaying {
            stopBackgroundAudio()
        } else {
            startBackgroundAudio()
        }
    }

    func startBackgroundAudio() {
        audioPlayer?.play()
        isPlaying = true
    }

    func stopBackgroundAudio() {
        audioPlayer?.stop()
        isPlaying = false
    }
}

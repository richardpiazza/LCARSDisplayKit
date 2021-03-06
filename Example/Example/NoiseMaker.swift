//
//  NoiseMaker.swift
//  LCARSDisplayKitExample
//
//  Created by Richard Piazza on 4/16/19.
//  Copyright © 2019 Richard Piazza. All rights reserved.
//

import Foundation
import AVFoundation
import LCARSDisplayKit

class NoiseMaker: NSObject {
    
    static var `default`: NoiseMaker = NoiseMaker(theme: TNG())
    
    private let neutralBeepData: Data
    private let successBeepData: Data
    private let failureBeepData: Data
    private var players: [AVAudioPlayer] = []
    
    private init(theme: Theme) {
        self.neutralBeepData = theme.neutralBeep
        self.successBeepData = theme.successBeep
        self.failureBeepData = theme.failureBeep
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - CommandSequencerDelegate
    
    public func neutralBeep() {
        guard let player = try? AVAudioPlayer(data: neutralBeepData) else {
            return
        }
        
        players.append(player)
        player.numberOfLoops = 0
        player.delegate = self
        player.play()
    }
    
    public func successBeep() {
        guard let player = try? AVAudioPlayer(data: successBeepData) else {
            return
        }
        
        players.append(player)
        player.numberOfLoops = 0
        player.delegate = self
        player.play()
    }
    
    public func failureBeep() {
        guard let player = try? AVAudioPlayer(data: failureBeepData) else {
            return
        }
        
        players.append(player)
        player.numberOfLoops = 0
        player.delegate = self
        player.play()
    }
}

extension NoiseMaker: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if let index = players.firstIndex(of: player) {
            players.remove(at: index)
        }
    }
}

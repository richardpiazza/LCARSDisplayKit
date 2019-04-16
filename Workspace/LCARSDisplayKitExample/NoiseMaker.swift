//
//  NoiseMaker.swift
//  LCARSDisplayKitExample
//
//  Created by Richard Piazza on 4/16/19.
//  Copyright © 2019 Richard Piazza. All rights reserved.
//

import Foundation
import AVFoundation
import LCARSDisplayKitUI

class NoiseMaker: CommandSequencerDelegate {
    
    static var shared: NoiseMaker = NoiseMaker()
    
    private lazy var neutralBeepPlayer: AVAudioPlayer = {
        guard let url = Configuration.theme.neutralBeepURL else {
            return AVAudioPlayer()
        }
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = 0
            return player
        } catch {
            print(error)
            return AVAudioPlayer()
        }
    }()
    
    private lazy var successBeepPlayer: AVAudioPlayer = {
        guard let url = Configuration.theme.successBeepURL else {
            return AVAudioPlayer()
        }
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = 0
            return player
        } catch {
            print(error)
            return AVAudioPlayer()
        }
    }()
    
    private lazy var failureBeepPlayer: AVAudioPlayer = {
        guard let url = Configuration.theme.failureBeepURL else {
            return AVAudioPlayer()
        }
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = 0
            return player
        } catch {
            print(error)
            return AVAudioPlayer()
        }
    }()
    
    private init() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - CommandSequencerDelegate
    
    public func neutralBeep() {
        neutralBeepPlayer.play()
    }
    
    public func successBeep() {
        successBeepPlayer.play()
    }
    
    public func failureBeep() {
        failureBeepPlayer.play()
    }
}

//===----------------------------------------------------------------------===//
//
// Audio.swift
//
// Copyright (c) 2017 Richard Piazza
// https://github.com/richardpiazza/LCARSDisplayKit
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
//===----------------------------------------------------------------------===//

import Foundation
import AVFoundation

struct Audio {
    static var beep1: AVAudioPlayer = {
        guard let url = Bundle.main.url(forResource: "beep1", withExtension: "m4a") else {
            fatalError("Failed to locate resource")
        }
        
        var player: AVAudioPlayer
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            fatalError(error.localizedDescription)
        }
        player.numberOfLoops = 0
        player.prepareToPlay()
        return player
    }()
    
    static var beep2: AVAudioPlayer = {
        guard let url = Bundle.main.url(forResource: "beep2", withExtension: "m4a") else {
            fatalError("Failed to locate resource")
        }
        
        var player: AVAudioPlayer
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            fatalError(error.localizedDescription)
        }
        player.numberOfLoops = 0
        player.prepareToPlay()
        return player
    }()
    
    static var beep3: AVAudioPlayer = {
        guard let url = Bundle.main.url(forResource: "beep3", withExtension: "m4a") else {
            fatalError("Failed to locate resource")
        }
        
        var player: AVAudioPlayer
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            fatalError(error.localizedDescription)
        }
        player.numberOfLoops = 0
        player.prepareToPlay()
        return player
    }()
    
    static func randomBeep() -> AVAudioPlayer {
        let players = [beep1, beep2, beep3]
        let random = arc4random_uniform(UInt32(players.count))
        return players[Int(random)]
    }
    
    static func playBeep() {
        beep3.play()
    }
}

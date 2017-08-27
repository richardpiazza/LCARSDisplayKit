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

public struct Audio {
    public static let engine: Audio = Audio()
    
    internal var beep1: SystemSoundID = 0
    internal var beep2: SystemSoundID = 0
    internal var beep3: SystemSoundID = 0
    
    init() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error.localizedDescription)
        }
        
        if let url = Bundle.main.url(forResource: "beep1", withExtension: "m4a") {
            AudioServicesCreateSystemSoundID(url as CFURL, &beep1)
        }
        
        if let url = Bundle.main.url(forResource: "beep2", withExtension: "m4a") {
            AudioServicesCreateSystemSoundID(url as CFURL, &beep2)
        }
        
        if let url = Bundle.main.url(forResource: "beep3", withExtension: "m4a") {
            AudioServicesCreateSystemSoundID(url as CFURL, &beep3)
        }
    }
    
    public func playBeep() {
        AudioServicesPlaySystemSound(beep3)
    }
    
    public func playRandomBeep() {
        let sounds = [beep1, beep2, beep3]
        let random = arc4random_uniform(UInt32(sounds.count))
        let soundID = sounds[Int(random)]
        AudioServicesPlaySystemSound(soundID)
    }
}

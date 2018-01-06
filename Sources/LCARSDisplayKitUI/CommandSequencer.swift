#if (os(iOS) || os(tvOS))

import UIKit
import AVFoundation
import LCARSDisplayKit

public typealias CommandSequence = [Button]
public typealias CommandSequenceCompletion = () -> Void
    
public struct CommandSequencer {
    public static var `default`: CommandSequencer = CommandSequencer()
    
    private var neutralBeepSoundID: SystemSoundID = 0
    private var successBeepSoundID: SystemSoundID = 0
    private var failureBeepSoundID: SystemSoundID = 0
    
    private var _commandSequences: [(CommandSequence, CommandSequenceCompletion)] = []
    private var _currentSequence: CommandSequence = CommandSequence()
    
    public init() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error.localizedDescription)
        }
        
        if let url = Configuration.theme.neutralBeepURL {
            AudioServicesCreateSystemSoundID(url as CFURL, &neutralBeepSoundID)
        }
        if let url = Configuration.theme.successBeepURL {
            AudioServicesCreateSystemSoundID(url as CFURL, &successBeepSoundID)
        }
        if let url = Configuration.theme.failureBeepURL {
            AudioServicesCreateSystemSoundID(url as CFURL, &failureBeepSoundID)
        }
    }
    
    public mutating func register(commandSequence sequence: CommandSequence, completion: @escaping CommandSequenceCompletion) {
        if _commandSequences.contains(where: { (s, c) -> Bool in
            return s == sequence
        }) {
            return
        }
        
        _commandSequences.append((sequence, completion))
    }
    
    public mutating func unregister(commandSequence sequence: CommandSequence) {
        var index: Int = -1
        for (idx, cs) in _commandSequences.enumerated() {
            if cs.0 == sequence {
                index = idx
                break
            }
        }
        
        guard index != -1 else {
            return
        }
        
        _commandSequences.remove(at: index)
    }
    
    public func neutralBeep() {
        guard neutralBeepSoundID != 0 else {
            return
        }
        
        AudioServicesPlaySystemSound(neutralBeepSoundID)
    }
    
    public func successBeep() {
        guard successBeepSoundID != 0 else {
            return
        }
        
        AudioServicesPlaySystemSound(successBeepSoundID)
    }
    
    public func failureBeep() {
        guard failureBeepSoundID != 0 else {
            return
        }
        
        AudioServicesPlaySystemSound(failureBeepSoundID)
    }
    
    private func completion(for commandSequence: CommandSequence) -> CommandSequenceCompletion? {
        let sequence = _commandSequences.first(where: { (s, c) -> Bool in
            return s == commandSequence
        })
        
        return sequence?.1
    }
    
    private func commandSequencesContainPrefix(_ commandSequence: CommandSequence) -> Bool {
        guard commandSequence.count > 0 else {
            return false
        }
        
        let sequence = _commandSequences.first(where: { (s, c) -> Bool in
            guard s.count >= commandSequence.count else {
                return false
            }
            
            for i in 0...commandSequence.count {
                if s[i] != commandSequence[i] {
                    return false
                }
            }
            
            return true
        })
        
        return sequence != nil
    }
    
    public mutating func didTouch(_ sender: Button) {
        _currentSequence.append(sender)
        
        if let completion = completion(for: _currentSequence) {
            print("Command Sequence Complete")
            completion()
            self.successBeep()
            _currentSequence.removeAll()
            return
        }
        
        if !commandSequencesContainPrefix(_currentSequence) {
            print("Command Sequence Failed")
            self.failureBeep()
            _currentSequence.removeAll()
            return
        }
        
        print("Command Sequence In Progress")
        self.neutralBeep()
    }
}

#endif

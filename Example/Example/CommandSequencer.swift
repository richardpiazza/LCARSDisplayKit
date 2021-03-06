import LCARSDisplayKit
import UIKit

public typealias CommandSequenceCompletion = () -> Void

public struct CommandSequence {
    public var path: [UIControl]
    public var completion: CommandSequenceCompletion?
    
    public init(_ path: [UIControl], completion: CommandSequenceCompletion? = nil) {
        self.path = path
        self.completion = completion
    }
}
    
public class CommandSequencer {
    public static var `default`: CommandSequencer = CommandSequencer(noiseMaker: .default)
    
    var noiseMaker: NoiseMaker
    private var commandSequences: [CommandSequence] = []
    private var currentPath: [UIControl] = []
    
    init(noiseMaker: NoiseMaker) {
        self.noiseMaker = noiseMaker
    }
    
    public func register(commandSequence sequence: CommandSequence) {
        if commandSequences.contains(where: { $0.path == sequence.path }) {
            return
        }
        
        print("Registering Command Sequence")
        commandSequences.append(sequence)
    }
    
    public func unregister(commandSequence sequence: CommandSequence) {
        var index: Int = -1
        for (idx, cs) in commandSequences.enumerated() {
            if cs.path == sequence.path {
                index = idx
                break
            }
        }
        
        guard index != -1 else {
            return
        }
        
        print("Unregistering Command Sequence")
        commandSequences.remove(at: index)
    }
    
    private func completion(for commandSequence: [UIControl]) -> CommandSequenceCompletion? {
        let sequence = commandSequences.first(where: { (cs) -> Bool in
            return cs.path == commandSequence
        })
        
        return sequence?.completion
    }
    
    private func sequencesContainingPrefix(_ commandSequence: [UIControl]) -> [CommandSequence] {
        guard commandSequence.count > 0 else {
            return []
        }
        
        var sequences = [CommandSequence]()
        for sequence in commandSequences {
            guard sequence.path.count >= commandSequence.count else {
                break
            }
            
            var prefixed = true
            for i in 0..<commandSequence.count {
                if sequence.path[i] != commandSequence[i] {
                    prefixed = false
                }
            }
            
            if prefixed {
                sequences.append(sequence)
            }
        }
        
        return sequences
    }
    
    public func didTouch(_ sender: UIControl) {
        currentPath.append(sender)
        
        guard commandSequences.count > 0 else {
            print("No Command Sequences")
            noiseMaker.failureBeep()
            currentPath.removeAll()
            return
        }
        
        if let completion = completion(for: currentPath) {
            print("Command Sequence Complete")
            completion()
            noiseMaker.successBeep()
            currentPath.removeAll()
            return
        }
        
        guard sequencesContainingPrefix(currentPath).count > 0 else {
            print("Command Sequence Failed")
            noiseMaker.failureBeep()
            currentPath.removeAll()
            return
        }
        
        print("Command Sequence In Progress")
        noiseMaker.neutralBeep()
    }
}

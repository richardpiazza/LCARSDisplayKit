import LCARSDisplayKit

class CommandSequencer {
    
    struct CommandSequence {
        var path: [CartesianShapeIdentifier]
        var activation: () -> Void = { }
    }
    
    private let audioPlayer: AudioPlayer
    private var commandSequences: [CommandSequence] = []
    private var currentPath: [CartesianShapeIdentifier] = []
    
    init(
        audioPlayer: AudioPlayer = AudioPlayer()
    ) {
        self.audioPlayer = audioPlayer
    }
    
    func register(commandSequence sequence: CommandSequence) {
        guard !commandSequences.contains(where: { $0.path == sequence.path }) else {
            return
        }
        
        print("Registering Command Sequence")
        commandSequences.append(sequence)
    }
    
    func unregister(commandSequence sequence: CommandSequence) {
        guard let index = commandSequences.firstIndex(where: { $0.path == sequence.path }) else {
            return
        }
        
        print("Unregistering Command Sequence")
        commandSequences.remove(at: index)
    }
    
    func didActivate(_ sender: CartesianShapeIdentifier) {
        currentPath.append(sender)
        
        guard commandSequences.count > 0 else {
            print("No Command Sequences")
            audioPlayer.playFailure()
            currentPath.removeAll()
            return
        }
        
        if let sequence = commandSequences.first(where: { $0.path == currentPath }) {
            print("Command Sequence Complete")
            sequence.activation()
            audioPlayer.playSuccess()
            currentPath.removeAll()
            return
        }
        
        guard sequencesContainingPrefix(currentPath).count > 0 else {
            print("Command Sequence Failed")
            audioPlayer.playFailure()
            currentPath.removeAll()
            return
        }
        
        print("Command Sequence In Progress")
        audioPlayer.playNeutral()
    }
    
    private func sequencesContainingPrefix(_ commandSequence: [CartesianShapeIdentifier]) -> [CommandSequence] {
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
}

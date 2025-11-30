import LCARSDisplayKit

class CommandSequencer {

    struct CommandSequence {
        var path: [CartesianIdentifier]
        var activation: () -> Void = {}
    }

    private let audioPlayer: AudioPlayer
    private var commandSequences: [CommandSequence] = []
    private var currentPath: [CartesianIdentifier] = []

    init(
        audioPlayer: AudioPlayer = AudioPlayer()
    ) {
        self.audioPlayer = audioPlayer
    }

    func register(commandSequence sequence: CommandSequence) {
        guard !commandSequences.contains(where: { $0.path == sequence.path }) else {
            return
        }

        commandSequences.append(sequence)
    }

    func register(commandSequence path: [CartesianIdentifier], activation: @escaping () -> Void) {
        register(
            commandSequence: CommandSequence(
                path: path,
                activation: activation
            )
        )
    }

    func unregister(commandSequence sequence: CommandSequence) {
        guard let index = commandSequences.firstIndex(where: { $0.path == sequence.path }) else {
            return
        }

        commandSequences.remove(at: index)
    }

    func didActivate(_ sender: CartesianIdentifier) {
        currentPath.append(sender)

        guard commandSequences.count > 0 else {
            audioPlayer.playFailure()
            currentPath.removeAll()
            return
        }

        if let sequence = commandSequences.first(where: { $0.path == currentPath }) {
            sequence.activation()
            audioPlayer.playSuccess()
            currentPath.removeAll()
            return
        }

        guard sequencesContainingPrefix(currentPath).count > 0 else {
            audioPlayer.playFailure()
            currentPath.removeAll()
            return
        }

        audioPlayer.playNeutral()
    }

    private func sequencesContainingPrefix(_ commandSequence: [CartesianIdentifier]) -> [CommandSequence] {
        guard commandSequence.count > 0 else {
            return []
        }

        var sequences = [CommandSequence]()
        for sequence in commandSequences {
            guard sequence.path.count >= commandSequence.count else {
                break
            }

            var prefixed = true
            for i in 0 ..< commandSequence.count {
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

import AVFoundation
import LCARSDisplayKit

struct AudioPlayer {

    private static func player(forResource name: String) -> AVAudioPlayer? {
        guard let url = Bundle.lcarsDisplayKit.url(forResource: name, withExtension: "m4a") else {
            return nil
        }

        guard let data = try? Data(contentsOf: url) else {
            return nil
        }

        guard let player = try? AVAudioPlayer(data: data) else {
            return nil
        }

        return player
    }

    private var neutralBeep: AVAudioPlayer? = Self.player(forResource: "beep3")
    private var successBeep: AVAudioPlayer? = Self.player(forResource: "beep2")
    private var failureBeep: AVAudioPlayer? = Self.player(forResource: "beep1")

    init() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error.localizedDescription)
        }
    }

    func playNeutral() {
        neutralBeep?.play()
    }

    func playSuccess() {
        successBeep?.play()
    }

    func playFailure() {
        failureBeep?.play()
    }
}

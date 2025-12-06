import Foundation

public enum ControlBehavior: Hashable, Sendable {
    case disabled
    case hidden
    case pulsing(timeInterval: TimeInterval)
}

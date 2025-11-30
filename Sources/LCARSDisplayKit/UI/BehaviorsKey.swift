#if canImport(SwiftUI)
import SwiftUI

private struct BehaviorsKey: EnvironmentKey {
    static let defaultValue: [CartesianIdentifier: ControlBehavior] = [:]
}

public extension EnvironmentValues {
    var behaviors: [CartesianIdentifier: ControlBehavior] {
        get { self[BehaviorsKey.self] }
        set { self[BehaviorsKey.self] = newValue }
    }
}
#endif

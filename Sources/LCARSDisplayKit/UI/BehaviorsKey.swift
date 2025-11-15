#if canImport(SwiftUI)
import SwiftUI

private struct BehaviorsKey: EnvironmentKey {
    static let defaultValue: [CartesianShapeIdentifier: ControlBehavior] = [:]
}

public extension EnvironmentValues {
    var behaviors: [CartesianShapeIdentifier: ControlBehavior] {
        get { self[BehaviorsKey.self] }
        set { self[BehaviorsKey.self] = newValue }
    }
}
#endif

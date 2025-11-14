#if canImport(SwiftUI)
import SwiftUI

private struct AppearanceKey: EnvironmentKey {
    static let defaultValue: any Appearance = Appearance2360s()
}

public extension EnvironmentValues {
    var appearance: any Appearance {
        get { self[AppearanceKey.self] }
        set { self[AppearanceKey.self] = newValue }
    }
}
#endif

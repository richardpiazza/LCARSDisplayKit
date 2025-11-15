#if canImport(SwiftUI)
import SwiftUI

private struct ThemeKey: EnvironmentKey {
    static let defaultValue: any Theme = Theme2360s()
}

public extension EnvironmentValues {
    var theme: any Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}
#endif

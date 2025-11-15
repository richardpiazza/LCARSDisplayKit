import SwiftColor
#if canImport(SwiftUI)
import SwiftUI

/// Appearance that mirrors colors used at the start of the TNG era.
public struct Theme2360s: Theme {
    public init() {}

    public func color(for appearance: ControlAppearance) -> Color {
        switch appearance {
        case .primaryDark:
            Color(uiColor: Pigment.neonCarrot.uiColor)
        case .primaryLight:
            Color(uiColor: Pigment.paleCanary.uiColor)
        case .primaryMedium:
            Color(uiColor: Pigment.goldenTainoi.uiColor)
        case .secondaryDark:
            Color(uiColor: Pigment.mariner.uiColor)
        case .secondaryLight:
            Color(uiColor: Pigment.babyBlueEyes.uiColor)
        case .secondaryMedium:
            Color(uiColor: Pigment.bahamaBlue.uiColor)
        case .tertiaryDark:
            Color(uiColor: Pigment.darkPurple.uiColor)
        case .tertiaryLight:
            Color(uiColor: Pigment.cosmic.uiColor)
        case .tertiaryMedium:
            Color(uiColor: Pigment.pastelViolet.uiColor)
        case .quaternaryDark:
            Color(uiColor: Pigment.flatGray.uiColor)
        case .quaternaryLight:
            Color(uiColor: Pigment.flatGray.uiColor)
        case .quaternaryMedium:
            Color(uiColor: Pigment.flatGray.uiColor)
        }
    }
}
#endif

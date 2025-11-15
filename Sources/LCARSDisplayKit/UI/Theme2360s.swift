import SwiftColor
#if canImport(SwiftUI)
import SwiftUI

/// Appearance that mirrors colors used at the start of the TNG era.
public struct Theme2360s: Theme {
    public init() {}

    public func color(for appearance: ControlAppearance) -> Color {
        switch appearance {
        case .primaryDark:
            Color(Pigment.neonCarrot.uiColor)
        case .primaryLight:
            Color(Pigment.paleCanary.uiColor)
        case .primaryMedium:
            Color(Pigment.goldenTainoi.uiColor)
        case .secondaryDark:
            Color(Pigment.mariner.uiColor)
        case .secondaryLight:
            Color(Pigment.babyBlueEyes.uiColor)
        case .secondaryMedium:
            Color(Pigment.bahamaBlue.uiColor)
        case .tertiaryDark:
            Color(Pigment.darkPurple.uiColor)
        case .tertiaryLight:
            Color(Pigment.cosmic.uiColor)
        case .tertiaryMedium:
            Color(Pigment.pastelViolet.uiColor)
        case .quaternaryDark:
            Color(Pigment.flatGray.uiColor)
        case .quaternaryLight:
            Color(Pigment.flatGray.uiColor)
        case .quaternaryMedium:
            Color(Pigment.flatGray.uiColor)
        }
    }
}
#endif

import SwiftColor
#if canImport(SwiftUI)
import SwiftUI

/// Appearance that mirrors colors used at the start of the TNG era.
public struct Theme2360s: Theme {
    public init() {}

    public func color(for appearance: ControlAppearance) -> Color {
        switch appearance {
        case .primaryDark:
            Pigment.neonCarrot.color
        case .primaryLight:
            Pigment.paleCanary.color
        case .primaryMedium:
            Pigment.goldenTainoi.color
        case .secondaryDark:
            Pigment.mariner.color
        case .secondaryLight:
            Pigment.babyBlueEyes.color
        case .secondaryMedium:
            Pigment.bahamaBlue.color
        case .tertiaryDark:
            Pigment.darkPurple.color
        case .tertiaryLight:
            Pigment.cosmic.color
        case .tertiaryMedium:
            Pigment.pastelViolet.color
        case .quaternaryDark:
            Pigment.flatGray.color
        case .quaternaryLight:
            Pigment.flatGray.color
        case .quaternaryMedium:
            Pigment.flatGray.color
        }
    }
}
#endif

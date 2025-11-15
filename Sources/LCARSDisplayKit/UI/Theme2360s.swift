import SwiftColor
#if canImport(SwiftUI)
import SwiftUI

/// Appearance that mirrors colors used at the start of the TNG era.
public struct Theme2360s: Theme {
    public init() {}
    
    public func color(for appearance: ControlAppearance) -> Color {
        switch appearance {
        case .primaryDark:
            return Color(uiColor: Pigment.neonCarrot.uiColor)
        case .primaryLight:
            return Color(uiColor: Pigment.paleCanary.uiColor)
        case .primaryMedium:
            return Color(uiColor: Pigment.goldenTainoi.uiColor)
        case .secondaryDark:
            return Color(uiColor: Pigment.mariner.uiColor)
        case .secondaryLight:
            return Color(uiColor: Pigment.babyBlueEyes.uiColor)
        case .secondaryMedium:
            return Color(uiColor: Pigment.bahamaBlue.uiColor)
        case .tertiaryDark:
            return Color(uiColor: Pigment.darkPurple.uiColor)
        case .tertiaryLight:
            return Color(uiColor: Pigment.cosmic.uiColor)
        case .tertiaryMedium:
            return Color(uiColor: Pigment.pastelViolet.uiColor)
        case .quaternaryDark:
            return Color(uiColor: Pigment.flatGray.uiColor)
        case .quaternaryLight:
            return Color(uiColor: Pigment.flatGray.uiColor)
        case .quaternaryMedium:
            return Color(uiColor: Pigment.flatGray.uiColor)
        }
    }
    
    public func textColor(on appearance: ControlAppearance) -> Color {
        .black
    }
}
#endif

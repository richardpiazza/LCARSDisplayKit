import SwiftColor
#if canImport(SwiftUI)
import SwiftUI

/// Appearance that mirrors colors used at the start of the TNG era.
public struct Appearance2360s: Appearance {
    public let primary: ColorGroup = ColorGroup(
        light: Color(Pigment.paleCanary.uiColor),
        medium: Color(Pigment.goldenTainoi.uiColor),
        dark: Color(Pigment.neonCarrot.uiColor)
    )
    
    public let secondary: ColorGroup = ColorGroup(
        light: Color(Pigment.babyBlueEyes.uiColor),
        medium: Color(Pigment.bahamaBlue.uiColor),
        dark: Color(Pigment.mariner.uiColor)
    )
    
    public let tertiary: ColorGroup = ColorGroup(
        light: Color(Pigment.cosmic.uiColor),
        medium: Color(Pigment.pastelViolet.uiColor),
        dark: Color(Pigment.darkPurple.uiColor)
    )
    
    public var inactive: Color = Color(Pigment.flatGray.uiColor)
    
    public init() {}
}
#endif

#if canImport(SwiftUI)
import SwiftUI

public struct ColorGroup {
    public let light: Color
    public let medium: Color
    public let dark: Color
    
    public init(light: Color, medium: Color, dark: Color) {
        self.light = light
        self.medium = medium
        self.dark = dark
    }
}
#endif

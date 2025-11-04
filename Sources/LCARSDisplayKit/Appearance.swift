#if canImport(SwiftUI)
import SwiftUI

public protocol Appearance {
    var primary: ColorGroup { get }
    var secondary: ColorGroup { get }
    var tertiary: ColorGroup { get }
    var inactive: Color { get }
}
#endif

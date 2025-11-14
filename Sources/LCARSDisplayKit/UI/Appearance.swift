#if canImport(SwiftUI)
import SwiftUI

public protocol Appearance {
    var primary: ColorGroup { get }
    var secondary: ColorGroup { get }
    var tertiary: ColorGroup { get }
    var inactive: Color { get }
    var text: Color { get }
    var inverseText: Color { get }
}

public extension Appearance {
    var text: Color { .black }
    var inverseText: Color { .white }
}
#endif

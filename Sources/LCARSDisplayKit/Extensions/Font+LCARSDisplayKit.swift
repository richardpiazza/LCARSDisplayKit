#if canImport(SwiftUI)
import SwiftUI

public extension Font {
    static func scaledLCARS(for textStyle: TextStyle) -> Font {
        let size: CGFloat = switch textStyle {
        case .largeTitle: 34.0
        case .extraLargeTitle: 36.0
        case .extraLargeTitle2: 28.0
        case .title: 28.0
        case .title2: 22.0
        case .title3: 20.0
        case .headline: 17.0
        case .subheadline: 15.0
        case .body: 17.0
        case .callout: 16.0
        case .footnote: 12.0
        case .caption: 12.0
        case .caption2: 11.0
        default: 17.0
        }

        return Font.custom("Swiss911 UCm BT", size: size, relativeTo: textStyle)
    }
}
#endif

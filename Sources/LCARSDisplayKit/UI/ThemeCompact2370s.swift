import SwiftColor
#if canImport(SwiftUI)
import SwiftUI

public struct ThemeCompact2370s: Theme {
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

    public func color(for id: CartesianShapeIdentifier) -> Color? {
        switch id {
        case .crux:
            color(for: .secondaryLight)
        case .sector1, .sector2, .sector3, .sector4:
            color(for: .quaternaryLight)
        default: nil
        }
    }

    public func gradient(for direction: Direction.Cardinal) -> LinearGradient {
        let (start, end, stop): (UnitPoint, UnitPoint, CGFloat) = switch direction {
        case .down:
            (.bottom, .top, 0.4)
        case .left:
            (.leading, .trailing, 0.4)
        case .up:
            (.top, .bottom, 0.6)
        case .right:
            (.trailing, .leading, 0.4)
        }

        return LinearGradient(
            stops: [
                Gradient.Stop(
                    color: color(for: .primaryDark),
                    location: 0
                ),
                Gradient.Stop(
                    color: color(for: .primaryDark),
                    location: stop
                ),
                Gradient.Stop(
                    color: color(for: .primaryLight),
                    location: stop
                ),
                Gradient.Stop(
                    color: color(for: .primaryLight),
                    location: 1.0
                ),
            ],
            startPoint: start,
            endPoint: end
        )
    }
}
#endif

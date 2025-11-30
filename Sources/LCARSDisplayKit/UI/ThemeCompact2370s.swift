import SwiftColor
#if canImport(SwiftUI)
import SwiftUI

public struct ThemeCompact2370s: Theme {
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

    public func color(for id: CartesianIdentifier) -> Color? {
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

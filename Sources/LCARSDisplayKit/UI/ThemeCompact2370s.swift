import SwiftColor
#if canImport(SwiftUI)
import SwiftUI

public struct ThemeCompact2370s: Theme {
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
                )
            ],
            startPoint: start,
            endPoint: end
        )
    }
}
#endif

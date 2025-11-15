#if canImport(SwiftUI)
import SwiftUI

public protocol Theme {
    func color(for appearance: ControlAppearance) -> Color
    func textColor(on appearance: ControlAppearance) -> Color
    func color(for id: CartesianShapeIdentifier) -> Color?
    func gradient(for direction: Direction.Cardinal) -> LinearGradient
}

public extension Theme {
    func textColor(on appearance: ControlAppearance) -> Color {
        .black
    }
    
    func color(for id: CartesianShapeIdentifier) -> Color? {
        nil
    }
    
    func gradient(for direction: Direction.Cardinal) -> LinearGradient {
        let (start, end): (UnitPoint, UnitPoint) = switch direction {
        case .down:
            (.bottom, .top)
        case .left:
            (.leading, .trailing)
        case .up:
            (.top, .bottom)
        case .right:
            (.trailing, .leading)
        }
        
        return LinearGradient(
            stops: [
                Gradient.Stop(
                    color: color(for: .primaryDark),
                    location: 0
                ),
                Gradient.Stop(
                    color: color(for: .primaryDark),
                    location: 0.4
                ),
                Gradient.Stop(
                    color: color(for: .primaryLight),
                    location: 0.4
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

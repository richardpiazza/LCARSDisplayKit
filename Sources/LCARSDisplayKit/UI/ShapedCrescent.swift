#if canImport(SwiftUI)
import GraphPoint
import SwiftUI

/// Properties uses to configure a button using the `DPad` Arcs.
@available(*, deprecated, message: "Use `CartesianControl`")
struct ShapedCrescent: Hashable {
    let id: CartesianIdentifier?
    let title: String
    let start: Degree
    let end: Degree
    let appearance: ControlAppearance
    let extended: Bool

    init(
        id: CartesianIdentifier? = nil,
        title: String,
        start: Degree,
        end: Degree,
        appearance: ControlAppearance,
        extended: Bool = false
    ) {
        self.id = id
        self.title = title
        self.start = start
        self.end = end
        self.appearance = appearance
        self.extended = extended
    }

    init(
        id: CartesianIdentifier? = nil,
        title: String,
        arc: Radial,
        to: Radial? = nil,
        appearance: ControlAppearance,
        extended: Bool = false,
    ) {
        self.id = id
        self.title = title
        start = arc.start
        if let to {
            end = to.end
        } else {
            end = arc.end
        }
        self.appearance = appearance
        self.extended = extended
    }

    func shape(
        interiorRadius: Radius,
        exteriorRadius: Radius,
        extendedRadius: Radius
    ) -> Crescent {
        Crescent(
            interiorArc: Arc(
                radius: interiorRadius,
                startingDegree: start,
                endingDegree: end
            ),
            exteriorArc: Arc(
                radius: extended ? extendedRadius : exteriorRadius,
                startingDegree: start,
                endingDegree: end
            )
        )
    }
}
#endif

import GraphPoint
#if canImport(SwiftUI)
import SwiftUI

/// Properties uses to configure a button using the `DPad` Arcs.
struct ShapedCrescent: Hashable {
    let id: CartesianIdentifier?
    let title: String
    let start: Degree
    let end: Degree
    let appearance: ControlAppearance
    let extended: Bool
    let parallelStart: Bool
    let parallelEnd: Bool

    init(
        id: CartesianIdentifier? = nil,
        title: String,
        start: Degree,
        end: Degree,
        appearance: ControlAppearance,
        extended: Bool = false,
        parallelStart: Bool = false,
        parallelEnd: Bool = false
    ) {
        self.id = id
        self.title = title
        self.start = start
        self.end = end
        self.appearance = appearance
        self.extended = extended
        self.parallelStart = parallelStart
        self.parallelEnd = parallelEnd
    }

    init(
        id: CartesianIdentifier? = nil,
        title: String,
        arc: Curve,
        to: Curve? = nil,
        appearance: ControlAppearance,
        extended: Bool = false,
        parallelStart: Bool = false,
        parallelEnd: Bool = false
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
        self.parallelStart = parallelStart
        self.parallelEnd = parallelEnd
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

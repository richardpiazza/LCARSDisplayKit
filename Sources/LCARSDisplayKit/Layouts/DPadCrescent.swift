import GraphPoint
#if canImport(SwiftUI)
import SwiftUI

/// Properties uses to configure a button using the `DPad` Arcs.
internal struct DPadCrescent: Hashable {
    let title: String
    let start: Degree
    let end: Degree
    let color: Color
    let extended: Bool
    let parallelStart: Bool
    let parallelEnd: Bool
    
    init(
        title: String,
        start: Degree,
        end: Degree,
        color: Color,
        extended: Bool = false,
        parallelStart: Bool = false,
        parallelEnd: Bool = false
    ) {
        self.title = title
        self.start = start
        self.end = end
        self.color = color
        self.extended = extended
        self.parallelStart = parallelStart
        self.parallelEnd = parallelEnd
    }
    
    init(
        title: String,
        arc: DPad.Ring,
        to: DPad.Ring? = nil,
        color: Color,
        extended: Bool = false,
        parallelStart: Bool = false,
        parallelEnd: Bool = false
    ) {
        self.title = title
        start = arc.start
        if let to {
            end = to.end
        } else {
            end = arc.end
        }
        self.color = color
        self.extended = extended
        self.parallelStart = parallelStart
        self.parallelEnd = parallelEnd
    }
    
    func shape(
        interiorRadius: Radius,
        exteriorRadius: Radius,
        extendedRadius: Radius,
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

import GraphPoint

public extension Arc {
    init(radius: Radius, arc convertible: DPad.Ring) {
        self.init(
            radius: radius,
            startingDegree: convertible.start,
            endingDegree: convertible.end
        )
    }
    
    init(radius: Radius, cardinalDirection convertible: DPad.CardinalDirection) {
        self.init(
            radius: radius,
            startingDegree: convertible.start,
            endingDegree: convertible.end
        )
    }
    
    init(radius: Radius, sector convertible: DPad.Sector) {
        self.init(
            radius: radius,
            startingDegree: convertible.start,
            endingDegree: convertible.end
        )
    }
    
    /// Arc with 'startingDegree' and 'endingDegree' reversed.
    var reversed: Arc {
        Arc(radius: radius, startingDegree: endingDegree, endingDegree: startingDegree)
    }
}

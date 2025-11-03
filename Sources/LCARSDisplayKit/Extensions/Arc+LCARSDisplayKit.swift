import GraphPoint

public extension Arc {
    @available(*, deprecated)
    init(radius: Radius, dPad: DPad) {
        self.init(radius: radius, startingDegree: dPad.start, endingDegree: dPad.end)
    }
    
    @available(*, deprecated)
    init(with: any DegreeConvertible, radius: Radius) {
        self.init(
            radius: radius,
            startingDegree: with.start,
            endingDegree: with.end
        )
    }
    
    init(radius: Radius, arc convertible: DPad.Arc) {
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

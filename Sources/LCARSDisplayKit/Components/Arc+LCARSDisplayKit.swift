import GraphPoint

public extension Arc {
    init(radius: Radius, dPad: DPad) {
        self.init(radius: radius, startingDegree: dPad.start, endingDegree: dPad.end)
    }
    
    /// Arc with 'startingDegree' and 'endingDegree' reversed.
    var reversed: Arc {
        return Arc(radius: radius, startingDegree: endingDegree, endingDegree: startingDegree)
    }
}

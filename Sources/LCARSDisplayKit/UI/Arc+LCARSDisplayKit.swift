import GraphPoint

public extension Arc {
    init(radius: Radius, dPad: DPad) {
        self.init(radius: radius, startingDegree: Degree(dPad.start), endingDegree: Degree(dPad.end))
    }
}

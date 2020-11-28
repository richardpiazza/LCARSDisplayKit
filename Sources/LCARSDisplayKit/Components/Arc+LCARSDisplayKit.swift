import GraphPoint

public extension Arc {
    init(radius: Radius, dPad: DPad) {
        self.init(radius: radius, startingDegree: dPad.start, endingDegree: dPad.end)
    }
}

import GraphPoint

public extension Arc {
    init(
        radius: Radius,
        radial: Radial,
        to: Radial? = nil
    ) {
        self.init(
            radius: radius,
            startingDegree: radial.start,
            endingDegree: to?.end ?? radial.end
        )
    }
}

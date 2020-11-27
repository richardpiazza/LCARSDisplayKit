import GraphPoint
#if canImport(CoreGraphics)
import CoreGraphics

extension CGMutablePath {
    @available(*, deprecated, renamed: "addArc(center:radius:startDegree:endDegree:clockwise:)")
    func addArc(center: CGPoint, radius: Radius, startAngle: Degree, endAngle: Degree, clockwise: Bool) {
        addArc(
            center: center,
            radius: CGFloat(radius),
            startAngle: CGFloat(startAngle),
            endAngle: CGFloat(endAngle),
            clockwise: clockwise
        )
    }
    
    /// Adds an arc of a circle to the path, specified with a radius and angles.
    ///
    /// This is a convenience method that will automatically convert the provided **Degree**s to **Radian**s required
    /// for the `CoreGraphics` framework.
    ///
    /// - parameter center: The center of the arc, in user space coordinates.
    /// - parameter radius: The radius of the arc, in user space coordinates.
    /// - parameter startDegree: The angle to the starting point of the arc, measured in degrees from the positive
    ///                          x-axis.
    /// - parameter endDegree: The angle to the end point of the arc, measured in degrees from the positive x-axis.
    /// - parameter clockwise: true to make a clockwise arc; false to make a counterclockwise arc.
    func addArc(center: CartesianPoint, radius: Radius, startDegree: Degree, endDegree: Degree, clockwise: Bool) {
        addArc(
            center: CGPoint(center),
            radius: CGFloat(radius),
            startAngle: CGFloat(startDegree.radians),
            endAngle: CGFloat(endDegree.radians),
            clockwise: clockwise
        )
    }
    
    func addArc(arc: Arc, center: CartesianPoint, clockwise: Bool) {
        addArc(
            center: CGPoint(center),
            radius: CGFloat(arc.radius),
            startAngle: CGFloat(arc.startingDegree.radians),
            endAngle: CGFloat(arc.endingDegree.radians),
            clockwise: clockwise
        )
    }
    
    func addLine(to point: CartesianPoint) {
        addLine(to: CGPoint(point))
    }
    
    func move(to point: CartesianPoint) {
        move(to: CGPoint(point))
    }
    
    func addRect(_ rect: CartesianFrame) {
        addRect(CGRect(rect))
    }
}

#endif

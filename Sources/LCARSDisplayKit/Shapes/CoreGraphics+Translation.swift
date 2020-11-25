import GraphPoint
#if canImport(CoreGraphics)
import CoreGraphics

extension CGMutablePath {
    func addArc(center: CGPoint, radius: Radius, startAngle: Degree, endAngle: Degree, clockwise: Bool) {
        addArc(
            center: center,
            radius: CGFloat(radius),
            startAngle: CGFloat(startAngle),
            endAngle: CGFloat(endAngle),
            clockwise: clockwise
        )
    }
    
    func addArc(center: CartesianPoint, radius: Radius, startAngle: Degree, endAngle: Degree, clockwise: Bool) {
        addArc(
            center: CGPoint(center),
            radius: CGFloat(radius),
            startAngle: CGFloat(startAngle.radians),
            endAngle: CGFloat(endAngle.radians),
            clockwise: clockwise
        )
    }
    
    func addLine(to point: CartesianPoint) {
        addLine(to: CGPoint(point))
    }
}

#endif

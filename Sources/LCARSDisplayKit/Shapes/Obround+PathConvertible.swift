#if canImport(CoreGraphics)
import CoreGraphics
import GraphPoint

extension Obround: PathConvertible {
    /// Calculates the radius of the arcs depending on `cornersOnly`
    private var radius: Radius {
        cornersOnly ? size.height * 0.25 : size.height * 0.5
    }

    private var upperLeftCenter: CartesianPoint {
        CartesianPoint(x: radius, y: radius)
    }

    private var lowerRightCenter: CartesianPoint {
        CartesianPoint(x: size.width - radius, y: size.height - radius)
    }

    public var path: CGPath {
        let path = CGMutablePath()

        switch (leftRounded, rightRounded, cornersOnly) {
        case (true, true, true):
            path.addArc(center: upperLeftCenter, radius: radius, startDegree: 180.0, endDegree: 270.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: lowerRightCenter.x, y: 0.0))
            path.addArc(center: CartesianPoint(x: lowerRightCenter.x, y: upperLeftCenter.y), radius: radius, startDegree: 270.0, endDegree: 0.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: size.width, y: lowerRightCenter.y))
            path.addArc(center: lowerRightCenter, radius: radius, startDegree: 0.0, endDegree: 90.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: upperLeftCenter.x, y: size.height))
            path.addArc(center: CartesianPoint(x: upperLeftCenter.x, y: lowerRightCenter.y), radius: radius, startDegree: 90.0, endDegree: 180.0, clockwise: false)
            path.closeSubpath()
        case (true, true, false):
            path.addArc(center: upperLeftCenter, radius: radius, startDegree: 90.0, endDegree: 270.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: lowerRightCenter.x, y: 0))
            path.addArc(center: lowerRightCenter, radius: radius, startDegree: 270.0, endDegree: 90.0, clockwise: false)
            path.closeSubpath()
        case (true, false, true):
            path.addArc(center: upperLeftCenter, radius: radius, startDegree: 180.0, endDegree: 270.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: size.width, y: 0))
            path.addLine(to: CartesianPoint(x: size.width, y: size.height))
            path.addLine(to: CartesianPoint(x: upperLeftCenter.x, y: size.height))
            path.addArc(center: CartesianPoint(x: upperLeftCenter.x, y: lowerRightCenter.y), radius: radius, startDegree: 90.0, endDegree: 170.0, clockwise: false)
            path.closeSubpath()
        case (true, false, false):
            path.addArc(center: upperLeftCenter, radius: radius, startDegree: 90.0, endDegree: 270.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: size.width, y: 0))
            path.addLine(to: CartesianPoint(x: size.width, y: size.height))
            path.closeSubpath()
        case (false, true, true):
            path.addArc(center: CartesianPoint(x: lowerRightCenter.x, y: upperLeftCenter.y), radius: radius, startDegree: 270.0, endDegree: 0.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: size.width, y: lowerRightCenter.y))
            path.addArc(center: lowerRightCenter, radius: radius, startDegree: 0.0, endDegree: 90.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: 0.0, y: size.height))
            path.addLine(to: CartesianPoint.zero)
            path.closeSubpath()
        case (false, true, false):
            path.addArc(center: lowerRightCenter, radius: radius, startDegree: 270.0, endDegree: 90.0, clockwise: false)
            path.addLine(to: CartesianPoint(x: 0.0, y: size.height))
            path.addLine(to: CartesianPoint.zero)
            path.closeSubpath()
        default:
            path.addRect(CartesianFrame(origin: .zero, size: size))
        }

        return path
    }
}
#endif
